package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.BlogPostRepo;
import be.intecbrussel.Blogcentral.model.BlogPost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<BlogPost> blogPosts = new ArrayList<>();
        BlogPostRepo blogPostRepo = new BlogPostRepo();

        // To display the 6 last in case no sort
        if (request.getParameter("tag") == null) {
            blogPosts = blogPostRepo.getPosts();
            request.setAttribute("count", 0);
            request.setAttribute("blogPosts", blogPosts);
            request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
        }

//        To display in case sort
        String sortType = "new";
        if (request.getParameter("sortType") != null) {
            sortType = (request.getParameter("sortType"));
        }

        int page = 1;
        int page_max = 1;
        int limit = 10;
        int offset = 0;
        int number_items = 0;
        String searchKey = request.getParameter("search");

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            page_max = page;

        }

        if (sortType.equals("old")) {
            blogPosts = (new BlogPostRepo()).searchBlogPosts(searchKey);  //TODO Write the corresponding SQL tools
        } else if (sortType.equals("popular")) {
            blogPosts = (new BlogPostRepo()).searchBlogPosts(searchKey);  //TODO Write the corresponding SQL tools
        } else {
            blogPosts = (new BlogPostRepo()).searchBlogPosts(searchKey);
        }

        number_items = blogPosts.size();

        page_max = (number_items / 10 == 0) ? number_items / 10 : 1 + number_items / 10;
        page_max = (page > page_max) ? page_max : page;
        offset = (page - 1) * 10;

        if (number_items < 10) {
            page = 1;
            offset = 0;
            limit = number_items;
        }

        if (page == page_max && number_items % 10 != 0) {
            limit = number_items - offset;
        }

        request.setAttribute("limit", limit);   // default value limit in jsp : 5 or 9
        request.setAttribute("count", offset);
        request.setAttribute("page", page);
        request.setAttribute("previous_page", page == 1 ? page : page - 1);
        request.setAttribute("page_max", page_max);
        request.setAttribute("next_page", page == page_max ? page : page + 1);
        request.setAttribute("sortType", sortType);
        request.setAttribute("blogPosts", blogPosts);
        request.setAttribute("searchResult", "searchResult");   // To help the sort choice change

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchKey = request.getParameter("search");
        List<BlogPost> blogPosts = (new BlogPostRepo()).searchBlogPosts(searchKey);

        int offset = 0;
        int page = 1;
        int number_items = blogPosts.size();
        int page_max = (number_items / 10 == 0) ? number_items / 10 : 1 + number_items / 10;
        page_max = (page_max < page) ? page: page_max;

        blogPosts.stream().forEach(System.out::println);

        request.setAttribute("count", offset);
        request.setAttribute("page", 1);
        request.setAttribute("page_max", page_max);
        request.setAttribute("previous_page", page + 1);
        request.setAttribute("next_page", page + 1);
        request.setAttribute("blogPosts", blogPosts);
        request.setAttribute("searchResult", "searchResult");
        request.setAttribute("sortType", "new");

        request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
    }
}
