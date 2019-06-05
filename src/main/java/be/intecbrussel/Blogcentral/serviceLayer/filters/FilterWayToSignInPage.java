package be.intecbrussel.Blogcentral.serviceLayer.filters;


import be.intecbrussel.Blogcentral.serviceLayer.LoginServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class FilterWayToSignInPage implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        if (session == null){
            request.getRequestDispatcher("/Central").forward(request,response);
        }else if (session.getAttribute(LoginServlet.USERNAME) != null &&
                (requestURI.startsWith("/WEB-INF/pages/SignIn.jsp") ||
                        requestURI.startsWith("/signup"))) {
            response.sendRedirect("/Central");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}