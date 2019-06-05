package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.AuthorRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = {"/AjaxController", "/AsynchronousServlet"}, name = "AjaxController")
public class AjaxController extends HttpServlet {
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException,
            IOException {

        response.setContentType("text/html");
        String username = request.getParameter("user_name");
        Boolean nameTaken = (new AuthorRepo()).isUsernameTaken(username);
        PrintWriter out = response.getWriter();

        out.print(nameTaken ? "<b style='color:red'>This username is  taken.</b> " : "" );



    }

}
