package be.intecbrussel.Blogcentral.serviceLayer;

import be.intecbrussel.Blogcentral.dataLayer.AuthorRepo;
import be.intecbrussel.Blogcentral.dataLayer.BadMethodCallException;
import be.intecbrussel.Blogcentral.model.Author;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;

@WebServlet("/image")
@MultipartConfig
public class ImageServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException
    {
        response.setContentType("image/jpeg");
        ServletOutputStream out;
        out = response.getOutputStream();

        AuthorRepo authorRepo = new AuthorRepo();
        Author author = authorRepo.readAuthor(Long.parseLong(request.getParameter("imageId")));

        ByteArrayInputStream binPut = new ByteArrayInputStream(author.getPhoto());
        BufferedOutputStream bout = new BufferedOutputStream(out);
        int ch =0;
        while((ch=binPut.read())!=-1)
        {
            bout.write(ch);
        }

        binPut.close();
        bout.close();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorRepo authorRepo = new AuthorRepo();
        Author author = authorRepo.readAuthor(-14);

        Part filePart = request.getPart("uploadfile");
        InputStream fileContent = filePart.getInputStream();


        byte[] fileAsByteArray = IOUtils.toByteArray(fileContent);

        author.setPhoto(fileAsByteArray);

        try {
            authorRepo.updateAuthor(author);
        } catch (BadMethodCallException e) {
            e.printStackTrace();
        }
    }
}

