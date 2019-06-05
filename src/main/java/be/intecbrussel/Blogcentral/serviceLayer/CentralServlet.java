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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


@WebServlet(name = "CentralServlet",value = "/Central")
public class CentralServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer count;
        String sortType = request.getParameter("sortType");
        List<BlogPost> blogPosts;

        BlogPostRepo blogPostRepo = new BlogPostRepo();
        blogPosts = blogPostRepo.getPosts();


        /** Counter for list iteration */

        if (request.getParameter("count") == null) {
            count = 0;
        } else {
            if (Integer.parseInt(request.getParameter("count")) >= blogPosts.size()) {
                count = blogPosts.size()-9;
            } else {
                count = Integer.parseInt(request.getParameter("count"));
            }
        }
        /** Comparator lambdas to sort blogPosts list*/

        if(sortType == null || sortType.equals("new")){
            sortType = "new";
            Collections.sort(blogPosts, Comparator.comparing(BlogPost::getPostTime).reversed());

        }
        else if (sortType.equals("old")){
            Collections.sort(blogPosts, Comparator.comparing(BlogPost::getPostTime));
        }
        else if(sortType.equals("popular")){
            Collections.sort(blogPosts, Comparator.comparing(BlogPost::getLikeClick).reversed());
        }


        session.setAttribute("count", count);
        session.setAttribute("sortType",sortType);
        session.setAttribute("blogPosts", blogPosts);
        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request,response);

    }

}
