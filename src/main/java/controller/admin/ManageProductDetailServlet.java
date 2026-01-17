package controller.admin;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductSpec;
import model.ProductVariant;
import service.AdminProductService;
import service.ProductDetailService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


//chi tiet quan ly sp Admin
@WebServlet(name = "ManageProductDetailServlet", value = "/admin/product-detail-manager")
public class ManageProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String vid = request.getParameter("vid");

        String action = request.getParameter("action");
        AdminProductService adminProductService = null;
        try {
            adminProductService = new AdminProductService();
            ProductDetailService productDetailService = new ProductDetailService();
            ProductService productService = new ProductService();

            if ("delete".equals(action)) {
                if (pid != null)
                    if (productService.deleteProduct(pid)) {
                        response.sendRedirect(request.getContextPath() + "/admin/product-manager");
                        return;
                    }
                if (vid != null)
                    if (adminProductService.deleteVariant(vid)) {
                        response.sendRedirect(request.getContextPath() + "/admin/product-manager");
                        return;
                    }

            }

            Product product = productService.getById(pid);
            List<ProductSpec> specs = productDetailService.getAllSpecByProductId(pid);
            List<ProductVariant> variants = productDetailService.getAllVariantByProductId(pid);
            List<String> imgs = productDetailService.getImageByProductId(pid);

            request.setAttribute("p", product);
            request.setAttribute("variants", variants);
            request.setAttribute("specs", specs);
            request.setAttribute("images", imgs);
            String variantsJson = new com.google.gson.Gson().toJson(variants);

            request.setAttribute("variantsJson", variantsJson);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/admin/product_detail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}