package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Product;
import service.BrandService;
import service.CategoryService;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdProductServlet", value = "/admin/add-product")
public class AdProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("inputNameProduct");
        int brandId = Integer.parseInt(request.getParameter("inputBrand"));
        int cateId = Integer.parseInt(request.getParameter("inputCate"));
        String sku = request.getParameter("inputSku");
        String desc = request.getParameter("inputDiscrip");
        boolean isActive = request.getParameter("isActive") != null;

        Product p = new Product();
        p.setName(name);
        p.setBrandId(brandId);
        p.setCategoriesId(cateId);
        p.setSku(sku);
        p.setDescription(desc);
        p.setActive(isActive);
        p.setAvgRating(5.0F);

        ProductService productService = null;
        try {
            productService = new ProductService();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        int newId = productService.addNewProduct(p);

        if (newId > 0) {
            request.getSession().setAttribute("msg", "success");
            response.sendRedirect(request.getContextPath() + "/admin/product-detail?pid=" + newId);
        } else {
            request.getSession().setAttribute("msg", "fail");
            request.setAttribute("inputNameProduct",name);
            request.setAttribute("inputBrand",name);
            request.setAttribute("inputCate",name);
            request.setAttribute("inputSku",name);
            request.setAttribute("inputDiscrip",name);
            request.setAttribute("isActive",name);
            request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);

        }
    }
}
