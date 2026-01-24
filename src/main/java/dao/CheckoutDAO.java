package dao;

import model.*;
import java.sql.*;
import java.util.List;

public class CheckoutDAO {

    // Lấy thông tin Voucher
    public Voucher getVoucherByCode(String code) {
        String sql = "SELECT * FROM vouchers WHERE code = ? AND valid_to > NOW() AND used_count < usage_limit";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Voucher v = new Voucher();
                v.setId(rs.getInt("id"));
                v.setCode(rs.getString("code"));
                v.setDiscountValue(rs.getDouble("discount_value"));
                v.setMinimumOrderAmount(rs.getDouble("min_order_amount"));
                return v;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    // Transaction: Lưu đơn hàng
    public boolean saveOrderInTransaction(Order order, OrderShipping shipping, List<CartItem> cartItems) {
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psShipping = null;
        PreparedStatement psItem = null;
        PreparedStatement psVoucher = null;
        ResultSet rs = null;

        try {
            conn = new DBConnect().getConnection();
            conn.setAutoCommit(false); // --- BẮT ĐẦU TRANSACTION ---

            // Thêm đơn vào orders
            String sqlOrder = "INSERT INTO orders (Users_id, Vouchers_id, order_code, order_date, status, payment_status, total_products_price, shipping_fee, discount_amount, final_amount) " +
                    "VALUES (?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?)";

            psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);

            if (order.getUsersId() == 0) psOrder.setNull(1, Types.INTEGER);
            else psOrder.setInt(1, order.getUsersId());

            if (order.getVouchersId() == 0 || order.getVouchersId() == null) psOrder.setNull(2, Types.INTEGER);
            else psOrder.setInt(2, order.getVouchersId());

            psOrder.setString(3, order.getOrderCode());
            psOrder.setString(4, order.getStatus());
            psOrder.setString(5, order.getPaymentStatus().name());
            psOrder.setDouble(6, order.getTotalProductsPrice());
            psOrder.setDouble(7, order.getShippingFee());
            psOrder.setDouble(8, order.getDiscountAmount());
            psOrder.setDouble(9, order.getFinalAmount());

            int affected = psOrder.executeUpdate();
            if (affected == 0) throw new SQLException("Creating order failed, no rows affected.");

            // Lấy id đơn
            int orderId = 0;
            rs = psOrder.getGeneratedKeys();
            if (rs.next()) orderId = rs.getInt(1);

            // Thêm đơn vào orderShipping
            String sqlShipping = "INSERT INTO ordershippings (Orders_id, recipient_name, phone, address, city, note) VALUES (?, ?, ?, ?, ?, ?)";
            psShipping = conn.prepareStatement(sqlShipping);
            psShipping.setInt(1, orderId);
            psShipping.setString(2, shipping.getRecipientName());
            psShipping.setString(3, shipping.getPhone());
            psShipping.setString(4, shipping.getAddress());
            psShipping.setString(5, shipping.getCity());
            psShipping.setString(6, shipping.getNote());
            psShipping.executeUpdate();

            // Thêm đơn vào orderItem
            String sqlItem = "INSERT INTO orderitems (Orders_id, ProductVariants_id, quantity, price_at_purchase) VALUES (?, ?, ?, ?)";
            psItem = conn.prepareStatement(sqlItem);

            for (CartItem item : cartItems) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProductVariant().getId());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getPrice());
                psItem.addBatch();
            }
            psItem.executeBatch();

            // Cập nhật voucher
            if (order.getVouchersId() != null && order.getVouchersId() > 0) {
                String sqlVou = "UPDATE vouchers SET used_count = used_count + 1 WHERE id = ?";
                psVoucher = conn.prepareStatement(sqlVou);
                psVoucher.setInt(1, order.getVouchersId());
                psVoucher.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            try { if (conn != null) conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psOrder != null) psOrder.close();
                if (psShipping != null) psShipping.close();
                if (psItem != null) psItem.close();
                if (psVoucher != null) psVoucher.close();
                if (conn != null) conn.close();
            } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}