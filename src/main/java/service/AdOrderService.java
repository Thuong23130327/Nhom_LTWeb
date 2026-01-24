package service;

import dao.OrderDao;
import dao.adminDAO.UserDAO;
import model.Order;
import model.OrderItems;
import model.User;

import java.util.ArrayList;
import java.util.List;

public class AdOrderService {
    OrderDao orderDao = new OrderDao();
    UserDAO userDAO = new UserDAO();

    public List<Order> geAllOrders() {
        return orderDao.getAllOrder();
    }

    public Order getOrderById(String id) {
        if (id == null || id.trim() == "") return null;
        return orderDao.getOrderById(id);
    }

    public List<OrderItems> getAllOrdersItem(String id) {
        if (id == null || id.trim() == "") return null;
        return orderDao.getAllOrdersItem(id);
    }

    public User getUserById(String id) {
        if (id == null || id.trim() == "") return null;
        return userDAO.getUserById(id);
    }

}
