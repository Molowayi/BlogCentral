package be.intecbrussel.Blogcentral.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
public class BlogPost implements Serializable {
    @Id
    @GeneratedValue
    private Long id;

    private String title;
    @Column(columnDefinition="TEXT")
    private String body;
    private Timestamp postTime = new  Timestamp(System.currentTimeMillis());
    private Integer likeClick;
    @ManyToOne
    private Author author;
    @OneToMany(mappedBy="blogPost")
    private List<AuthorComment> commentsList = new ArrayList<>();

    public BlogPost() {
    }

    public BlogPost(String title, String body) {
        this.title = title;
        this.body = body;
        this.likeClick = 0;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }


    public void setLikeClick(Integer likeClick) {
        this.likeClick = likeClick;
    }

    public Author getAuthor() {
        return author;
    }

    public Integer getLikeClick() {
        return likeClick;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public List<AuthorComment> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<AuthorComment> commentsList) {
        this.commentsList = commentsList;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setLikeClick(int likeClick) {
        this.likeClick = likeClick;
    }

    public void addAuthorComment(AuthorComment authorComment) {
        this.commentsList.add(authorComment);
        authorComment.setBlogPost(this);
    }

    public void removeAuthorComment(AuthorComment authorComment) {
        this.commentsList.remove(authorComment);
        authorComment.setBlogPost(null);
    }


    @Override
    public String toString() {
        return "BlogPost{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", body='" + body + '\'' +
                ", postTime=" + postTime +
                ", likeClick=" + likeClick;
    }
}
