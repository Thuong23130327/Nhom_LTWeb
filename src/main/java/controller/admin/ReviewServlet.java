package controller.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.ReviewService;
import util.CloundinaryLib;

import java.io.IOException;
import java.util.Map;
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "ReviewServlet", value = "/add-Review")
public class ReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rating = request.getParameter("rating");
        String inputPid = request.getParameter("inputPid");
        String comment = request.getParameter("comment");
        String inputUid = request.getParameter("inputUid");
        Part reviewFiles = request.getPart("reviewFiles");
        String finalImgUrl = "";

        if (reviewFiles != null && reviewFiles.getSize() > 0) {
            Cloudinary cloudinary = CloundinaryLib.getCloudinary();
            byte[] fileBytes = reviewFiles.getInputStream().readAllBytes();
            Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.emptyMap());

            finalImgUrl = uploadResult.get("secure_url").toString();
        }

        ReviewService service = new ReviewService();
        int a = service.addReview(inputPid, inputUid, rating, comment, finalImgUrl);
        HttpSession session = request.getSession();
        if (a != -1)
            session.setAttribute("msg", "success");

        else
            session.setAttribute("msg", "fail");
        response.sendRedirect(request.getContextPath() + "/detail?pid=" + inputPid);
    }
}