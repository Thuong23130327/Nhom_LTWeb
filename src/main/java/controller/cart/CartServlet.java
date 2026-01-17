package controller.cart;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Product;

import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            String pid = request.getParameter("pid");
            String qtyStr = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            try {
                if ("add".equals(action) && pid != null) {
                    int qty = (qtyStr != null) ? Integer.parseInt(qtyStr) : 1;
                    Product p = new ProductDAO().getById(pid);
                    if (p != null) cart.addOrUpdateItem(p, qty);
                } else if ("delete".equals(action) && pid != null) {
                    cart.deleteItem(Integer.parseInt(pid));
                }
            } catch (Exception e) { e.printStackTrace(); }

            response.sendRedirect("cart.jsp");
        }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
