package controller;

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


@WebServlet(name = "LoadMoreServlet", value = "/load")
public class LoadMoreServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateId = request.getParameter("cateId");
        ProductService productService = null;
        try {
            productService = new ProductService();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        int pageCurrent = Integer.parseInt(request.getParameter("pageCurrent"));
        List<Product> productList = productService.getPerPageProduct(12, pageCurrent,cateId);
        request.setAttribute("pageCurrent", pageCurrent);
        PrintWriter out = response.getWriter();
        if (productList == null || productList.isEmpty()) {
            out.println("");
            return;
        }

        NumberFormat vnFormatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        for (Product p : productList) {
            String formattedSellPrice = vnFormatter.format(p.getSellPrice());
            String formattedOldPrice = vnFormatter.format(p.getOldPrice());
            out.println("<a href=\"detail?pid=" + p.getId() + "\" class=\"product-card\">\n");
            if (p.getDiscountPercent() > 0) {
                out.println("   <div class=\"product-badge discount\">Giảm " + p.getDiscountPercent() + " %</div>\n");
            }


            out.println("\n" +
                    "                    <img src=\"" + p.getImg() + "\" alt=\"" + p.getName() + "\" onerror=\"this.src='https://placehold.co/300x300?text=No+Image'\">\n" +
                    "\n" +
                    "                    <div class=\"product-card-info\">\n" +
                    "                        <h4>" + p.getName() + "</h4>\n" +
                    "\n" +
                    "                        <div class=\"price-block\">\n" +
                    "                            <div class=\"new-price\">" + formattedSellPrice + " đ</div>\n" +
                    "\n");
            if (p.getDiscountPercent() > 0) {
                out.println(" <div class=\"old-price\">" + formattedOldPrice + " đ</div>\n");
            }
            out.println("                        </div>\n" +
                    "                        <div class=\"product-bottom-row\">\n" +
                    "                            <div class=\"rating\">\n" +
                    "                                <i class=\"bi bi-star-fill\"></i>\n" +
                    "                                <span>" + p.getAvgRating() + "</span>\n" +
                    "                            </div>\n" +
                    "                            <div class=\"favorite\">\n" +
                    "                                <i class=\"bi bi-heart\"></i>\n" +
                    "                                <span>Yêu thích</span>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </a>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}