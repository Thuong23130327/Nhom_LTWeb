package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.ProductDAO;
import dao.VariantDAO;
import dao.SpecDAO;
import dao.GalleryDAO;
import model.Product;
import model.ProductVariant;
import model.ProductSpec;
@WebServlet("/product-detail")
public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {

        String idRaw = request.getParameter("id");
        
        try {
            if (idRaw != null) {
                int productId = Integer.parseInt(idRaw);

                ProductDAO pDao = new ProductDAO();
                VariantDAO vDao = new VariantDAO();
                SpecDAO sDao = new SpecDAO();
                GalleryDAO gDao = new GalleryDAO();

                Product product = pDao.getById(productId);
                List<ProductVariant> variants = vDao.getVariantsByProductId(productId);
                List<ProductSpec> specs = sDao.getSpecsByProductId(productId);
                List<String> images = gDao.getImagesByProductId(productId);

                // 4. Đẩy dữ liệu sang trang JSP
                request.setAttribute("product", product);
                request.setAttribute("variants", variants);
                request.setAttribute("specs", specs);
                request.setAttribute("images", images);

                request.getRequestDispatcher("sproduct.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("home");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        super.doPost(request, response);
    }
}