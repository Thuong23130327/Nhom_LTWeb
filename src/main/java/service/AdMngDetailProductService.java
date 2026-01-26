package service;

import dao.GalleryDAO;
import dao.ProductDAO;
import dao.VariantDAO;
import model.Product;

import java.sql.SQLException;

public class AdMngDetailProductService {

    ProductDAO productDao = new ProductDAO();
    VariantDAO variantDao = new VariantDAO();
    GalleryDAO galleryDao = new GalleryDAO();

    public boolean updateProduct(String pid, String brandid, String cateid, String name, String sku, String discript, String varSelected, String isActive) throws SQLException {

        return productDao.updateProduct(pid, brandid, cateid, name, sku, discript, varSelected, isActive);

    }

    public static void main(String[] args) throws SQLException {
        AdMngDetailProductService s = new AdMngDetailProductService();
        System.out.println(s.updateProduct("1", "1", "3", "Tai nghe Sony chup tai WH-1000XM5", "SN-XM5", "Tai nghe Sony WH-1000XM5 - Chống ồn dịu tai, sử dụng thoải mái\n" +
                "Sony WH-1000XM5 với thiết kế chống ồn dòng cao cấp, được trang bị bộ xử lý QN1. Đây là một trong những tai nghe chụp tai tốt trong phân khúc chống ồn chủ động.\n" +
                "\n" +
                "Thiết kế đẹp mắt, cá tính và có tính năng hạn chế chống ồn dịu tai\n" +
                "Tai nghe sở hữu thiết kế kiểu choàng đầu phong cách cá tính. Khi không sử dụng, bạn có thể gấp gọn lại và thuận tiện cho bạn mang theo trong công việc hay bất cứ nơi đâu. Đặc biệt, bao bì tai nghe không sử dụng nhựa thay vào đó là các vật liệu tái chế an toàn cho môi trường.\n" +
                "\n" +
                "Chiếc tai nghe WH-1000XM5 này đẹp bắt mắt về kiểu dáng, tốt về chất lượng với lớp vỏ được bao bọc bằng nhựa cứng chắc, mượt mà, không hề thô cứng cùng với miếng đệm tai nghe bằng da màu đen sang trọng và tạo cảm giác êm ái. Đệm tai được hoàn thiện từ da mềm cùng thiết kế ôm khít đầu nhưng không hề gây áp lực lên đôi tai.", "2", "1"));
    }

    public boolean updateSpecs(String[] inputSpecIds, String[] inputSpecValue) throws SQLException {
        if (inputSpecIds.length != inputSpecValue.length) return false;
        if (inputSpecIds == null || inputSpecValue == null) return false;
        return productDao.updateSpecs(inputSpecIds, inputSpecValue);

    }

    public boolean updateVariant(String vid, String inputClName, String inputStock, String inputOldP, String inputNewP, String finalImgUrl) throws SQLException {
        return variantDao.updateVariant(vid, inputClName, inputStock, inputOldP, inputNewP, finalImgUrl);


    }

    public boolean addVariant(String inputPid, String inputClName, String inputStock, String inputOldP, String inputNewP, String finalImgUrl) throws SQLException {
        return variantDao.addVariant(inputPid, inputClName, inputStock, inputOldP, inputNewP, finalImgUrl);

    }

    public boolean updateOrderImage(String[] inputImageIds, String[] inputOrderIds) {
        return galleryDao.updateOrderImage(inputImageIds, inputOrderIds);


    }

    public boolean addImage(String pid, String img) {
        return galleryDao.addImage(pid, img);


    }

    public boolean delImage(String inputPid, String imgId) {
        return galleryDao.delImage(inputPid, imgId);



    }
}
