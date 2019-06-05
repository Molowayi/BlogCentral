package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.AuthorRepo;
import be.intecbrussel.Blogcentral.model.Author;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(value = "/login", name = "loginServlet")
public class LoginServlet extends HttpServlet {
    public static final String USERNAME = "userName";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session.getAttribute(USERNAME)!=null){
            request.getRequestDispatcher("/Central").forward(request, response);
        }else {
            request.getRequestDispatcher("WEB-INF/pages/Login.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorRepo authorRepo = new AuthorRepo();
        HttpSession session = request.getSession(false);
        String userName = request.getParameter("username");
        String userPass = request.getParameter("password");

        for (Author author:authorRepo.getAuthors()){
            if((author.getUserName().equalsIgnoreCase(userName)||author.getEmail().equals(userName))&&author.getPassWord().equals(userPass)){
                session.setAttribute(USERNAME,author.getUserName());
                response.sendRedirect(request.getContextPath()+"/Central");
                break;
            }
        }
        if (session.getAttribute(USERNAME)==null){
            response.sendRedirect(request.getContextPath()+"/login");
        }
    }
}
