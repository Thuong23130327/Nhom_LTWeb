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
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;


@WebServlet(name = "LoadPageAjaxServlet", value = "/loadAjax")
public class LoadPageAjaxServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = null;
        List<Product> productList = null;
        try {
            productService = new ProductService();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        //Lay para
        String[] selectedBrands = request.getParameterValues("selectedBrands");
        String[] selectedCates = request.getParameterValues("selectedCates");
        int pageCurrent = Integer.parseInt(request.getParameter("pageCurrent"));
        String selectedSort = request.getParameter("selectedSort") != null ? request.getParameter("selectedSort") : "default";
        String cateId = request.getParameter("cateId");

        if (selectedBrands == null) selectedBrands = new String[0];
        if (selectedCates == null) selectedCates = new String[0];
        productList = productService.filterProduct(selectedBrands, selectedCates, 12, pageCurrent, selectedSort);

        PrintWriter out = response.getWriter();
        int totalPage = (int) Math.ceil((double) productService.totalProduct(selectedBrands, selectedCates) / 12);
        System.out.println(Arrays.toString(selectedBrands));
        System.out.println(Arrays.toString(selectedCates));
        System.out.println("tong trang: " + totalPage);
        out.println(totalPage + "||||");


        if (productList == null || productList.isEmpty()) {
            out.println("<div class=\"alert alert-warning text-center\" role=\"alert\">\n" +
                    "        <i class=\"bi bi-search\"></i> \n" +
                    "        Không tìm thấy sản phẩm nào phù hợp với bộ lọc\"<strong></strong>\"\n" +
                    "    </div>");
            return;
        }
        NumberFormat vnFormatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        for (Product p : productList) {
            String formattedSellPrice = vnFormatter.format(p.getSellPrice());
            String formattedOldPrice = vnFormatter.format(p.getOldPrice());
            String imageSrc = (p.getImg() != null && !p.getImg().isEmpty()) ? p.getImg() : "https://placehold.co/300x300?text=No+Image";
            out.println("<a href=\"detail?pid=" + p.getId() + "\" class=\"product-card\">\n");
            if (p.getDiscountPercent() > 0) {
                out.println("   <div class=\"product-badge discount\">Giảm " + p.getDiscountPercent() + " %</div>\n");
            }


            out.println("\n" +
                    "                    <img src=\"" + imageSrc + "\" alt=\"" + p.getName() + "\" onerror=\"this.src='https://placehold.co/300x300?text=No+Image'\">\n" +
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