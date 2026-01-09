package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductDTO;
import model.ProductSpec;
import model.ProductVariant;
import service.ProductDetailService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductDetailServlet", value = "/detail")
public class ProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        if (pid == null) {
            response.sendRedirect("home"); // Hoặc trang lỗi
            return;
        }

        try {
            ProductDetailService productDetailService = new ProductDetailService();
            ProductService productService = new ProductService();
            Product product = productService.getById(pid);

            if (product == null) {
                response.sendError(404, "Sản phẩm không tồn tại!");
                return; // Dừng ngay, không chạy tiếp code bên dưới
            }

            List<ProductSpec> specs = productDetailService.getAllSpecByProductId(pid);
            List<ProductVariant> variants = productDetailService.getAllVariantByProductId(pid);
            List<String> imgs = productDetailService.getImageByProductId(pid);
            ProductVariant curVariant = productDetailService.getVariantByImg(variants, product.getImg());

            request.setAttribute("product", product);
            request.setAttribute("variants", variants);
            request.setAttribute("specs", specs);
            request.setAttribute("images", imgs);
            request.setAttribute("curVariant", curVariant);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/sproduct.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}

//public class ProductDetailServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
//
//        String idRaw = request.getParameter("id");
//
//        try {
//            if (idRaw != null) {
//                int productId = Integer.parseInt(idRaw);
//
//                ProductDAO pDao = new ProductDAO();
//                VariantDAO vDao = new VariantDAO();
//                SpecDAO sDao = new SpecDAO();
//                GalleryDAO gDao = new GalleryDAO();
//
//                Product product = pDao.getById(productId);
//                List<ProductVariant> variants = vDao.getVariantsByProductId(productId);
//                List<ProductSpec> specs = sDao.getSpecsByProductId(productId);
//                List<String> images = gDao.getImagesByProductId(productId);
//
//                // 4. Đẩy dữ liệu sang trang JSP
//                request.setAttribute("product", product);
//                request.setAttribute("variants", variants);
//                request.setAttribute("specs", specs);
//                request.setAttribute("images", images);
//
//                request.getRequestDispatcher("sproduct.jsp").forward(request, response);
//            } else {
//                response.sendRedirect("home");
//            }
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            response.sendRedirect("home");
//        }
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
//        super.doPost(request, response);
//    }
//}