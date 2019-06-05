package be.intecbrussel.Blogcentral.dataLayer;


import be.intecbrussel.Blogcentral.model.Author;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AuthorRepo {

    private final EntityManager em;

    public AuthorRepo() {
        this.em = EntityManagerMaker.emCreator();
    }


    public Author createAuthor(Author author) {
        return persistAuthor(author);
    }


    public Author updateAuthor(Author author) throws BadMethodCallException {
        if (author.getId() == 0) throw new BadMethodCallException();
        return persistAuthor(author);
    }


    public Author deleteAuthor(Author author) {
        em.getTransaction().begin();
        em.remove(author);
        em.getTransaction().commit();

        return author;
    }


    public Author readAuthor(long id) {
        return em.find(Author.class, id);
    }

    public Author readAuthor(String username) {
        List<Author> authors = this.getAuthors();
        for (Author author : authors) {
            if (author.getUserName().equals(username)) {
                return author;
            }
        }
        return null;
    }

    public Boolean isUsernameTaken(String username) {
        Author author = this.readAuthor(username);
        return author == null ? false : true;
    }

    private Author persistAuthor(Author author) {
        em.getTransaction().begin();
        em.persist(author);
        em.getTransaction().commit();
        return author;
    }

    public Author mergeAuthor(Author author) {
        em.getTransaction().begin();
        em.merge(author);
        em.getTransaction().commit();
        return author;
    }

    public List<Author> getAuthors() {
        Query query1 = em.createQuery("SELECT author from Author as author ");

        return (List<Author>) query1.getResultList();
    }

}