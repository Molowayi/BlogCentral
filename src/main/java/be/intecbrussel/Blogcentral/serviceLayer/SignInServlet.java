package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.AuthorRepo;
import be.intecbrussel.Blogcentral.dataLayer.BadMethodCallException;
import be.intecbrussel.Blogcentral.dataLayer.HelperRepo;
import be.intecbrussel.Blogcentral.model.Author;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/signup")
public class SignInServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/pages/SignIn.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AuthorRepo authorRepo = new AuthorRepo();
        HelperRepo helperRepo = new HelperRepo();
        List<Author> authors = authorRepo.getAuthors();
        String page = null;
        boolean sameName = false;
        boolean passMismatch = false;

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String street = request.getParameter("street");
        String houseNr = request.getParameter("houseNr");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        String pass = request.getParameter("pass");
        String repeatPass = request.getParameter("repeat-pass");
        String userName = request.getParameter("userName");


        for (Author author : authors) {
            if (author.getUserName().equals(userName)) {
                page = "/signup";
                sameName = true;
                System.out.println("Username already taken.");
                break;
            }
        }


        if (!pass.equals(repeatPass)) {
            page = "/signup";
            passMismatch = true;
            System.out.println("Password doesn't match.");
        }


        if (!sameName && !passMismatch) {
            try {
                helperRepo.createAuthor(firstName, lastName, userName, email, street, houseNr, city, zipcode, pass);
                page = "/Central";
            } catch (BadMethodCallException e) {
                String globalMessage = "Something went wrong with your registration. Please try again.";
                request.setAttribute("faultMessage", globalMessage);
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("userName", userName);
                request.setAttribute("email", email);
                request.setAttribute("street", street);
                request.setAttribute("number", houseNr);
                request.setAttribute("city", city);
                request.setAttribute("zipcode", zipcode);
                HttpSession session = request.getSession();
                session.setAttribute(LoginServlet.USERNAME,userName);
                request.getRequestDispatcher("WEB-INF/pages/SignIn.jsp").forward(request, response);

            }
        }

        response.sendRedirect(request.getContextPath() + page);

    }
}
