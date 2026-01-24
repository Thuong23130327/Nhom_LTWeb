package service;

import dao.OrderDao;
import dao.ProductDAO;
import dao.VariantDAO;
import dao.adminDAO.UserDAO;
import model.*;

import java.util.ArrayList;
import java.util.List;

public class AdOrderService {
    OrderDao orderDao = new OrderDao();
    ProductDAO productDAO = new ProductDAO();
    VariantDAO variantDAO = new VariantDAO();
    UserDAO userDAO = new UserDAO();

    public List<Order> geAllOrders() {
        return orderDao.getAllOrder();
    }

    public Order getOrderById(String id) {
        if (id == null || id.trim() == "") return null;
        return orderDao.getOrderById(id);
    }

    public List<CartItem> getAllOrdersItem(String id) {
        if (id == null || id.trim() == "") return null;
        return orderDao.getAllOrdersItem(id);
    }

    public OrderShipping getOrShip(String id) {
        if (id == null || id.trim() == "") return null;
        return orderDao.getOrShip(id);
    }

    public boolean updateStatus(String orderId, String newStatus) {
        if (orderId == null || orderId.trim() == "") return false;
        if (newStatus == null || newStatus.trim() == "")
            return false;
        if (newStatus.equals("Completed")) {
            orderDao.updatePayment(orderId, "Paid");
            return orderDao.updateStatus(orderId, "Completed");
        }
        if (newStatus.equals("Cancelled")) {
            orderDao.updatePayment(orderId, "Unpaid");
            return orderDao.updateStatus(orderId, "Cancelled");
        }
        return orderDao.updateStatus(orderId, newStatus);

    }

    public boolean updateAdNote(String orderId, String newStatus) {
        if (orderId == null || orderId.trim() == "") return false;
        if (newStatus == null || newStatus.trim() == "")
            return false;
        return orderDao.updateAdNote(orderId, newStatus);
    }


}
