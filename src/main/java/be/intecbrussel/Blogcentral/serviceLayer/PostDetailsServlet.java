package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.BlogPostRepo;
import be.intecbrussel.Blogcentral.model.BlogPost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// TODO implement this controller redirecting to post detail pages
@WebServlet(value = "/postDetails")
public class PostDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Long id = Long.parseLong(req.getParameter("id"));
        BlogPost blogPost = new BlogPostRepo().getPostsById(id);

        session.setAttribute("blogpost", blogPost);

        req.getRequestDispatcher("/WEB-INF/pages/blogPage.jsp").forward(req, resp);

    }


}
