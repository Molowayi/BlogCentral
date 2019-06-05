package be.intecbrussel.Blogcentral.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
public class AuthorComment implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    private String comment;
    @ManyToOne
    private BlogPost blogPost;
    @ManyToOne
    private Author author;

    public AuthorComment() {
    }

    public AuthorComment(String comment) {
        this.comment = comment;

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public BlogPost getBlogPost() {
        return blogPost;
    }

    public void setBlogPost(BlogPost blogPost) {
        this.blogPost = blogPost;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "AuthorComment{" +
                "id=" + id +
                ", comment='" + comment;
    }


}
