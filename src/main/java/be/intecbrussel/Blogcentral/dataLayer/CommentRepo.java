package be.intecbrussel.Blogcentral.dataLayer;



import be.intecbrussel.Blogcentral.model.AuthorComment;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;


public class CommentRepo {
    private final EntityManager em;

    public CommentRepo() {
        this.em = EntityManagerMaker.emCreator();
    }


    public AuthorComment createComment(AuthorComment authorComment) {
        return persistComment(authorComment);
    }


    public AuthorComment updateComment(AuthorComment authorComment) throws BadMethodCallException {
        if (authorComment.getId() == 0) throw new BadMethodCallException();
        return persistComment(authorComment);
    }


    public AuthorComment deleteComment(AuthorComment authorComment) {
        em.getTransaction().begin();
        em.remove(authorComment);
        em.getTransaction().commit();

        return authorComment;
    }


    public AuthorComment readComment(long id) {
        return em.find(AuthorComment.class, id);
    }


    private AuthorComment persistComment(AuthorComment authorComment) {
        em.getTransaction().begin();
        em.persist(authorComment);
        em.getTransaction().commit();
        return authorComment;
    }

    public AuthorComment mergeComment(AuthorComment authorComment) {
        em.getTransaction().begin();
        em.merge(authorComment);
        em.getTransaction().commit();
        return authorComment;
    }

    public List<AuthorComment> getComments() {
        Query query1 = em.createQuery("SELECT authorComment from AuthorComment as authorComment");

        return (List<AuthorComment>) query1.getResultList();
    }



}

