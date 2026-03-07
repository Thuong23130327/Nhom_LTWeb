package dao;

import model.*;
import org.jdbi.v3.core.Jdbi;

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

    private Jdbi jdbi = dao.DB.DBConnect.getJdbi();

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
        String sql = "SELECT o.*, os.recipient_name  " +
                "from orders o  " +
                "LEFT JOIN ordershippings os ON o.id = os.Orders_id " +
                "ORDER BY o.order_date DESC;";

        return jdbi.withHandle(handle -> handle.createQuery(sql).mapToBean(Order.class).list());
    }

    public Order getOrderById(String id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Order.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    public List<Order> getAllOrderById(int userId) {
        String sql = "SELECT o.*, os.recipient_name  " +
                "from orders o  " +
                "LEFT JOIN ordershippings os ON o.id = os.Orders_id " +
                "WHERE o.Users_id = :uid " +
                "ORDER BY o.order_date DESC;";

        return jdbi.withHandle(handle -> handle.createQuery(sql).bind("uid", userId).mapToBean(Order.class).list());
    }

    public static void main(String[] args) {
        OrderDao dao = new OrderDao();
        System.out.println(dao.getAllOrder().toString());
        System.out.println("--");
        System.out.println(dao.getAllOrderById(1).toString());
    }


    public List<Order> getOrdersByStatus(int userId, String status) {

        String sql = "SELECT o.*, os.recipient_name " +
                "FROM orders o " +
                "LEFT JOIN ordershippings os ON o.id = os.Orders_id " +
                "WHERE o.Users_id = :uid AND o.status = :status " +
                "ORDER BY o.order_date DESC;";

        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("uid", userId)
                .bind("status", status)
                .mapToBean(Order.class).list());

    }

    //đơn chờ xử lý
    public List<Order> getPendingOrders(int userId) {
        return getOrdersByStatus(userId, "Pending");
    }

    //đơn đang giao
    public List<Order> getShippingOrders(int userId) {
        return getOrdersByStatus(userId, "Shipping");
    }

    //đơn hoàn thành
    public List<Order> getCompletedOrders(int userId) {
        return getOrdersByStatus(userId, "Completed");
    }

    //đơn đã hủy
    public List<Order> getCancelledOrders(int userId) {
        return getOrdersByStatus(userId, "Cancelled");
    }


    public OrderShipping getOrShip(String ordId) {

        String sql = "SELECT*FROM ordershippings WHERE id = :oid";


        return (OrderShipping) jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("oid", ordId)
                .mapToBean(OrderShipping.class));
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
        String sql = "UPDATE orders SET status = :status WHERE id = :id";

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", newStatus)
                        .bind("id", orderId)
                        .execute() > 0
        );
    }

    public boolean updatePayment(String orderId, String newStatus) {
        String sql = "UPDATE orders SET payment_status = :status WHERE id = :id";

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", newStatus)
                        .bind("id", orderId)
                        .execute() > 0
        );
    }

    public boolean updateAdNote(String orderId, String newNote) {
        String sql = "UPDATE orders SET admin_note = :adNote WHERE id = :id";

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("adNote", newNote)
                        .bind("id", orderId)
                        .execute() > 0
        );
    }
}
