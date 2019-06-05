package be.intecbrussel.Blogcentral.dataLayer;


import be.intecbrussel.Blogcentral.model.Author;
import be.intecbrussel.Blogcentral.model.AuthorComment;
import be.intecbrussel.Blogcentral.model.BlogPost;

public class HelperRepo {
    private AuthorRepo authorRepo = new AuthorRepo();
    private CommentRepo commentRepo = new CommentRepo();
    private BlogPostRepo blogPostRepo = new BlogPostRepo();


    public void createAuthor(String firstName, String lastName, String userName, String email, String street, String houseNr, String city, String zip, String passWord) throws BadMethodCallException {

        Author author = new Author(firstName, lastName, userName, email, street, houseNr, city, zip, passWord);
        authorRepo.createAuthor(author);

    }

    public void createAuthor(Author author) {
        authorRepo.createAuthor(author);
    }

    public void deleteAuthor(Author author) {
        author = authorRepo.readAuthor(author.getId());
        for (int i = 0; i < author.getAuthorCommentList().size(); i++) {
            author.removeAuthorComment(author.getAuthorCommentList().get(i));

        }

        for (int i = 0; i < author.getPostsList().size(); i++) {
            author.removeBlogPost(author.getPostsList().get(i));
        }
        authorRepo.deleteAuthor(author);
    }

    public void deleteAuthor(Long authorId) {
        Author author = authorRepo.readAuthor(authorId);
        for (int i = 0; i < author.getAuthorCommentList().size(); i++) {
            author.removeAuthorComment(author.getAuthorCommentList().get(i));

        }

        for (int i = 0; i < author.getPostsList().size(); i++) {
            author.removeBlogPost(author.getPostsList().get(i));
        }
        authorRepo.deleteAuthor(author);
    }

    public void deleteAllAuthorRecords(Author author) {

        author = authorRepo.readAuthor(author.getId());

        for (int i = 0; i < author.getAuthorCommentList().size(); i++) {
            deleteAuthorComment(author.getAuthorCommentList().get(i).getId());
        }

        for (int i = 0; i < author.getPostsList().size(); i++) {
            for (int j = 0; i < author.getPostsList().get(i).getCommentsList().size(); i++) {
                deleteAuthorComment(author.getPostsList().get(i).getCommentsList().get(j).getId());
            }
            deleteBlogPost(author.getPostsList().get(i).getId());

        }
        authorRepo.deleteAuthor(author);
    }


    public void deleteAllAuthorRecords(Long authorId) {

        Author author = authorRepo.readAuthor(authorId);

        for (int i = 0; i < author.getAuthorCommentList().size(); i++) {
            deleteAuthorComment(author.getAuthorCommentList().get(i).getId());
        }

        for (int i = 0; i < author.getPostsList().size(); i++) {
            for (int j = 0; i < author.getPostsList().get(i).getCommentsList().size(); i++) {
                deleteAuthorComment(author.getPostsList().get(i).getCommentsList().get(j).getId());
            }
            deleteBlogPost(author.getPostsList().get(i).getId());

        }
        authorRepo.deleteAuthor(author);
    }

    public void deleteAuthorComment(AuthorComment authorComment) {
        authorComment = commentRepo.readComment(authorComment.getId());
        commentRepo.deleteComment(authorComment);
    }

    public void deleteAuthorComment(Long idComment) {
        AuthorComment authorComment = commentRepo.readComment(idComment);
        commentRepo.deleteComment(authorComment);
    }

    public void deleteBlogPost(BlogPost blogPost) {
        blogPost = blogPostRepo.readPost(blogPost.getId());
        for (int i = 0; i < blogPost.getCommentsList().size(); i++) {
            deleteAuthorComment(blogPost.getCommentsList().get(i).getId());
        }
        blogPostRepo.deletePost(blogPost);
    }

    public void deleteBlogPost(Long idBlogPost) {
        BlogPost blogPost = blogPostRepo.readPost(idBlogPost);

        for (int i = 0; i < blogPost.getCommentsList().size(); i++) {
            deleteAuthorComment(blogPost.getCommentsList().get(i).getId());
        }

        blogPostRepo.deletePost(blogPost);
    }

    public void createAuthorComment(Long authorId, Long blogPostId, String commentBody) throws BadMethodCallException {
        Author author = authorRepo.readAuthor(authorId);
        BlogPost blogPost = blogPostRepo.readPost(blogPostId);
        if (author == null) {
            System.out.println("Author id not found.");

        }
        if (blogPost == null) {
            System.out.println("Blogpost id not found.");
        } else {
            AuthorComment authorComment = new AuthorComment(commentBody);
            author.addAuthorComment(authorComment);
            blogPost.addAuthorComment(authorComment);
            commentRepo.createComment(authorComment);
            blogPostRepo.updatePost(blogPost);
            authorRepo.updateAuthor(author);

        }

    }

    public void createAuthorComment(Author author, BlogPost blogPost, String commentBody) throws BadMethodCallException {
        author = authorRepo.readAuthor(author.getId());
        blogPost = blogPostRepo.readPost(blogPost.getId());
        if (author == null) {
            System.out.println("Author id not found.");

        }
        if (blogPost == null) {
            System.out.println("Blogpost id not found.");
        } else {
            AuthorComment authorComment = new AuthorComment(commentBody);
            author.addAuthorComment(authorComment);
            blogPost.addAuthorComment(authorComment);
            commentRepo.createComment(authorComment);
            blogPostRepo.updatePost(blogPost);
            authorRepo.updateAuthor(author);
        }

    }

    public void createBlogPost(Long authorId, String title, String body) throws BadMethodCallException {
        Author author = authorRepo.readAuthor(authorId);
        if (author == null) {
            System.out.println("Author id not found.");
        } else {
            BlogPost blogPost = new BlogPost(title, body);
            author.addBlogPost(blogPost);
            blogPostRepo.createPost(blogPost);
            authorRepo.updateAuthor(author);

        }
    }

    public void createBlogPost(Author author, String title, String body) throws BadMethodCallException {
        author = authorRepo.readAuthor(author.getId());
        if (author == null) {
            System.out.println("Author id not found.");
        } else {
            BlogPost blogPost = new BlogPost(title, body);
            author.addBlogPost(blogPost);
            blogPostRepo.createPost(blogPost);
            authorRepo.updateAuthor(author);

        }
    }

    public void editBlogPost(Long blogPostId) throws BadMethodCallException {
        BlogPost blogPost = blogPostRepo.readPost(blogPostId);
        blogPostRepo.updatePost(blogPost);
    }


    public void editBlogPost(BlogPost blogPost) throws BadMethodCallException {
        blogPost = blogPostRepo.readPost(blogPost.getId());
        blogPostRepo.updatePost(blogPost);
    }

    public void editAuthorComment(AuthorComment authorComment) throws BadMethodCallException {
        authorComment = commentRepo.readComment(authorComment.getId());
        commentRepo.updateComment(authorComment);
    }

    public void editAuthorComment(Long authorCommentId) throws BadMethodCallException {
        AuthorComment authorComment = commentRepo.readComment(authorCommentId);
        commentRepo.updateComment(authorComment);
    }


}