package be.intecbrussel.Blogcentral.serviceLayer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogOutServlet",value = "/LogOut")
public class LogOutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session.getAttribute(LoginServlet.USERNAME) != null) {
            session.invalidate();
            response.sendRedirect(request.getContextPath()+"/Central");
        }
    }
}
