package be.intecbrussel.Blogcentral.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Author implements Serializable {
    @Id
    @GeneratedValue
    private Long id;

    private String firstName;
    private String lastName;
    private String userName;
    private String email;
    private String street;
    private String houseNr;
    private String city;
    private String zip;
    private String passWord;

    @Lob
    @Column(length=16777215)
    private byte[] photo;

    @OneToMany(mappedBy="author")
    private List<BlogPost> postsList = new ArrayList<>();

    @OneToMany(mappedBy="author")
    private List<AuthorComment> commentsList =new ArrayList<>();

    public Author() {

    }

    public Author(String firstName, String lastName, String userName, String email, String street, String houseNr, String city, String zip, String passWord) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.street = street;
        this.houseNr = houseNr;
        this.city = city;
        this.zip = zip;
        this.passWord = passWord;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNr() {
        return houseNr;
    }

    public void setHouseNr(String houseNr) {
        this.houseNr = houseNr;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public List<BlogPost> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<BlogPost> postsList) {
        this.postsList = postsList;
    }

    public List<AuthorComment> getAuthorCommentList() {
        return commentsList;
    }

    public void setAuthorCommentList(List<AuthorComment> authorCommentList) {
        this.commentsList = authorCommentList;
    }

    public void addAuthorComment(AuthorComment authorComment) {
        this.commentsList.add(authorComment);
        authorComment.setAuthor(this);
    }

    public void removeAuthorComment(AuthorComment authorComment) {
        this.commentsList.remove(authorComment);
        authorComment.setAuthor(null);
    }

    public void addBlogPost(BlogPost blogPost){
        this.postsList.add(blogPost);
        blogPost.setAuthor(this);
    }

    public void removeBlogPost(BlogPost blogPost){
        this.postsList.remove(blogPost);
        blogPost.setAuthor(null);
    }

    @Override
    public String toString() {
        return "Author{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", street='" + street + '\'' +
                ", houseNr='" + houseNr + '\'' +
                ", city='" + city + '\'' +
                ", zip='" + zip + '\'' +
                ", passWord='" + passWord + '\'' +
                ", photo='" + photo + '\'';
    }
}
