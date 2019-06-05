package be.intecbrussel.Blogcentral.dataLayer;



import be.intecbrussel.Blogcentral.model.BlogPost;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class BlogPostRepo {
    private final EntityManager em;

    public BlogPostRepo() {
        this.em = EntityManagerMaker.emCreator();
    }


    public BlogPost createPost(BlogPost blogPost) {
        return persistPost(blogPost);
    }


    public BlogPost updatePost(BlogPost blogPost) throws BadMethodCallException {
        if (blogPost.getId() == 0) throw new BadMethodCallException();
        return persistPost(blogPost);
    }


    public BlogPost deletePost(BlogPost blogPost) {
        em.getTransaction().begin();
        em.remove(blogPost);
        em.getTransaction().commit();

        return blogPost;
    }


    public BlogPost readPost(long id) {
        return em.find(BlogPost.class, id);
    }


    private BlogPost persistPost(BlogPost blogPost) {
        em.getTransaction().begin();
        em.persist(blogPost);
        em.getTransaction().commit();
        return blogPost;
    }

    public BlogPost mergePost(BlogPost blogPost) {
        em.getTransaction().begin();
        em.merge(blogPost);
        em.getTransaction().commit();
        return blogPost;
    }


    public List<BlogPost> getPosts() {
        Query query = em.createQuery("SELECT blogpost from BlogPost as blogpost ORDER BY postTime DESC");

        return (List<BlogPost>) query.getResultList();
    }

    public List<BlogPost> getOldPosts(){
        Query query = em.createQuery("SELECT blogpost from BlogPost as blogpost ORDER BY postTime ASC");

        return (List<BlogPost>) query.getResultList();
    }

    public List<BlogPost> getPopularPosts(){
        Query query = em.createQuery("SELECT blogpost from BlogPost as blogpost ORDER BY blogpost.likeClick DESC");

        return (List<BlogPost>) query.getResultList();
    }

    public List<BlogPost> getUnpopularPosts(){
        Query query = em.createQuery("SELECT blogpost from BlogPost as blogpost ORDER BY blogpost.likeClick ASC");

        return (List<BlogPost>) query.getResultList();
    }

    public List getPostsAndAuthors() {
        Query query = em.createQuery("SELECT blogpost, author.firstName from BlogPost as blogpost INNER JOIN blogpost.author AS author");

        return  query.getResultList();
    }

    public List<BlogPost> getPostsByAuthor(String userName){
        Query query = em.createQuery("SELECT blogpost FROM BlogPost as blogpost INNER JOIN blogpost.author AS author WHERE author.userName = :userName");
        query.setParameter("userName", userName);

        return (List<BlogPost>) query.getResultList();

    }

    public List<BlogPost> searchBlogPosts(String searchPara) {
        Query query = em.createQuery("SELECT blogPost FROM BlogPost AS  blogPost INNER JOIN blogPost.author AS author WHERE blogPost.title LIKE :title OR author.userName LIKE :userName ORDER BY blogPost.postTime DESC");

        query.setParameter("title","%"+searchPara+"%");
        query.setParameter("userName","%"+searchPara+"%");

        return (List<BlogPost>) query.getResultList();
    }

    public List<BlogPost> searchBlogPostsOld(String searchPara) {
        Query query = em.createQuery("SELECT blogPost FROM BlogPost AS  blogPost INNER JOIN blogPost.author AS author WHERE blogPost.title LIKE :title OR author.userName LIKE :userName ORDER BY blogPost.postTime ASC");

        query.setParameter("title","%"+searchPara+"%");
        query.setParameter("userName","%"+searchPara+"%");

        return (List<BlogPost>) query.getResultList();
    }

    public List<BlogPost> searchBlogPostsPopular(String searchPara) {
        Query query = em.createQuery("SELECT blogPost FROM BlogPost AS  blogPost INNER JOIN blogPost.author AS author WHERE blogPost.title LIKE :title OR author.userName LIKE :userName ORDER BY blogPost.likeClick DESC");

        query.setParameter("title","%"+searchPara+"%");
        query.setParameter("userName","%"+searchPara+"%");

        return (List<BlogPost>) query.getResultList();
    }

    public BlogPost getPostsById(Long id){
        Query query = em.createQuery("SELECT blogpost FROM BlogPost as blogpost  WHERE blogpost.id = :id");
        query.setParameter("id", id);

        return (BlogPost) query.getSingleResult();

    }



}

