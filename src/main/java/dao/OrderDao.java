package dao;

import model.Order;
import model.OrderItems;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private Order mapOrder(ResultSet rs) throws SQLException {
        return new Order(rs.getInt("id"),
                rs.getInt("Users_id"),
                rs.getInt("Vouchers_id"),
                rs.getString("order_code"),
                rs.getTimestamp("order_date"),
                rs.getString("status"),
                rs.getString("payment_status"),
                rs.getInt("total_products_price"),
                rs.getDouble("shipping_fee"),
                rs.getDouble("discount_amount"),
                rs.getDouble("final_amount"));
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY id";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next())
                list.add(mapOrder(rs));
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Order getOrderById(String id) {
        String sql = "SELECT * FROM orders where id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next())
                return mapOrder(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private OrderItems mapOrderItem(ResultSet rs) throws SQLException {
        return new OrderItems(rs.getInt("id"),
                rs.getInt("orders_id"),
                rs.getInt("productvariants_id"),
                rs.getInt("quantity"),
                rs.getDouble("price_at_purchase"));
    }

    public List<OrderItems> getAllOrdersItem(String id) {
        List<OrderItems> list = new ArrayList<>();
        String sql = "SELECT * FROM orderitems where orders_id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next())
                list.add(mapOrderItem(rs));
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
