package controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String qtyStr = request.getParameter("q");
        String action = request.getParameter("action");
        if (action == null) action = "add";

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        try {
            ProductService productService = new ProductService();

            switch (action) {
                case "add":
                    if (idStr != null) {
                        int id = Integer.parseInt(idStr);
                        int quantity = (qtyStr != null) ? Integer.parseInt(qtyStr) : 1;
                        Product product = productService.getProduct(id);
                        if (product != null) {
                            cart.addItem(product, quantity);
                        }
                    }
                    break;

                case "delete":
                    if (idStr != null) {
                        int id = Integer.parseInt(idStr);
                        cart.deleteItem(id);
                    }
                    break;

                case "clear":
                    cart.deleteAllItems();
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
    }
        response.sendRedirect("cart.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
