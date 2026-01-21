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
import java.util.List;

@WebServlet(name = "SearchAjax", value = "/searchAjax")
public class SearchAjax extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        try {
            ProductService productService = new ProductService();
            List<Product> list = productService.searchProductByText(search);

            PrintWriter out = response.getWriter();
            for (Product p : list) {
                out.print("<a productCount href=\"detail?pid=" + p.getId() + "\" class=\"product-card\">\n" +
                        "                    <c:if test=\"" + p.getDiscountPercent() +
                        "> 0" +
                        "                        <div class=\"product-badge discount\">Giảm " +
                        p.getDiscountPercent() +
                        "%</div>\n" +
                        "                    </c:if>\n" +
                        "\n" +
                        "                    <img src=\"" +
                        p.getImg() +
                        "\" alt=\"" +
                        p.getName() +
                        "\" onerror=\"this.src='https://placehold.co/300x300?text=No+Image'\">\n" +
                        "\n" +
                        "                    <div class=\"product-card-info\">\n" +
                        "                        <h4>" + p.getName() + "</h4>\n" +
                        "\n" +
                        "                        <div class=\"price-block\">\n" +
                        "                            <div class=\"new-price\"><fmt:formatNumber value=\"" + p.getSellPrice() + "\" pattern=\"#,###\"/> đ</div>\n" +
                        "\n" +
                        "                            <c:if test=\"${p.discountPercent > 0}\">\n" +
                        "                                <div class=\"old-price\"><fmt:formatNumber value=\"" + p.getOldPrice() + "\" pattern=\"#,###\"/> đ</div>\n" +
                        "                            </c:if>\n" +
                        "\n" +
                        "                        </div>\n" +
                        "\n" +
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

            request.setAttribute("productList", list);
            request.setAttribute("search", search);
//            Chung voi trang headphones (hien thi sp)
            request.getRequestDispatcher("/headphones.jsp").forward(request, response);
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