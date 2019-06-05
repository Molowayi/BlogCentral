package be.intecbrussel.Blogcentral.dataLayer;


import be.intecbrussel.Blogcentral.model.Author;
import be.intecbrussel.Blogcentral.model.BlogPost;
import org.hibernate.Hibernate;

import java.io.*;
import java.sql.Blob;
import java.util.Base64;
import java.util.List;

public class supersenan {
    public static void main(String[] args) throws BadMethodCallException, IOException {

        AuthorRepo authorRepo = new AuthorRepo();
        CommentRepo commentRepo = new CommentRepo();
        BlogPostRepo postRepo = new BlogPostRepo();

        HelperRepo helperRepo = new HelperRepo();


        
        EntityManagerMaker.closeSession();

    }


}
