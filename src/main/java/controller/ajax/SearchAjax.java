package controller.ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "SearchAjax", value = "/searchAjax")
public class SearchAjax extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        NumberFormat vnFormatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        String search = request.getParameter("search");
        try {
            ProductService productService = new ProductService();
            List<Product> productList = productService.searchProductByText(search);
            PrintWriter out = response.getWriter();
            if (productList == null || productList.isEmpty()) {
                out.println("<a href='product' class='search-item'>");
                out.println("   <div class='info'>");
                out.println("       <div class='name'> Không tìm thấy sản phẩm nào </div>");
                out.println("   </div>");
                out.println("</a>");
                return;
            }
            // Trong Servlet, vòng lặp tạo HTML trả về
            for (Product p : productList) {

                productService.updateSearchCount(String.valueOf(p.getId()));


                out.println("<a href='detail?pid=" + p.getId() + "' class='search-item'>");
                out.println("   <img src='" + p.getImg() + "' alt='" + p.getName() + "'>");
                out.println("   <div class='info'>");
                out.println("       <div class='name'>" + p.getName() + "</div>");
                out.println("       <div class='price'>" + vnFormatter.format(p.getSellPrice()) + " đ</div>");
                out.println("   </div>");
                out.println("</a>");
            }

            request.setAttribute("productList", productList);
            request.setAttribute("search", search);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}