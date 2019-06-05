package be.intecbrussel.Blogcentral.serviceLayer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class BlogCentralListener implements HttpSessionListener {


    public static final String TOTAL = "totalVisitors";
    public static final String ONLINE = "onlineAuthors";

    public void sessionCreated(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        int totalVisitors = 1;
        int visitorsActive = 1;

        Integer total = (Integer) servletContext.getAttribute(TOTAL);
        if (total != null) {
            totalVisitors = total + 1;
        }
        servletContext.setAttribute(TOTAL, totalVisitors);

        Integer active = (Integer) servletContext.getAttribute(ONLINE);
        if (active != null) {
            visitorsActive = active + 1;
        }
        servletContext.setAttribute(ONLINE, visitorsActive);


    }

    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        Integer active = (Integer) servletContext.getAttribute(ONLINE);

        int visitorsActive = 0;
        if (active != null) {
            visitorsActive = active - 1;
        }
        servletContext.setAttribute(ONLINE, visitorsActive);


    }


}
