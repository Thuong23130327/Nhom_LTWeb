package dao;

import model.*;

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
                rs.getDouble("final_amount"),
                rs.getString("admin_note"));
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.*, os.recipient_name  " +
                "from orders o  " +
                "LEFT JOIN ordershippings os ON o.id = os.Orders_id " +
                "ORDER BY o.order_date DESC;";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            Order order;

            while (rs.next()) {
                order = mapOrder(rs);
                order.setRecipientName(rs.getString("recipient_name"));
                list.add(order);
            }

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
            Order order = null;
            if (rs.next()) {
                return mapOrder(rs);
            }
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

    public OrderShipping getOrShip(String ordId) {
        String sql = "SELECT*FROM ordershippings WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ordId);
            rs = ps.executeQuery();
            if (rs.next())
                return new OrderShipping(
                        rs.getInt("id"),
                        rs.getInt("orders_id"),
                        rs.getString("recipient_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("city"),
                        rs.getString("note")
                );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<CartItem> getAllOrdersItem(String id) {
        List<CartItem> list = new ArrayList<>();

        String sql = " SELECT p.name, pv.*, oi.quantity, oi.price_at_purchase " +
                " FROM orderitems oi " +
                " JOIN productvariants pv ON oi.productvariants_id = pv.id " +
                " JOIN products p ON pv.products_id = p.id " +
                " WHERE oi.orders_id = ? ";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductVariant pv = new ProductVariant(
                        rs.getInt("id"),
                        rs.getInt("products_id"),
                        rs.getString("variant_sku"),
                        rs.getString("color_name"),
                        rs.getString("main_image_url"),
                        rs.getDouble("market_price"),
                        rs.getDouble("sell_price"),
                        rs.getInt("stock_quantity"),
                        rs.getInt("sold_quantity"),
                        rs.getBoolean("is_default"));
                list.add(new CartItem(rs.getString("name"),
                        pv,
                        rs.getInt("quantity"),
                        rs.getDouble("price_at_purchase")));

            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateStatus(String orderId, String newStatus) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setString(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePayment(String orderId, String newStatus) {
        String sql = "UPDATE orders SET payment_status = ? WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setString(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAdNote(String orderId, String newNote) {
        String sql = "UPDATE orders SET admin_note = ? WHERE id = ?";
        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newNote);
            ps.setString(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
