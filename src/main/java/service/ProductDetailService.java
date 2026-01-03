//package service;
//
//import java.sql.SQLException;
//import java.util.HashMap;
//import java.util.Map;
//
//import dao.GalleryDAO;
//import dao.ProductDAO;
//import dao.SpecDAO;
//import dao.VariantDAO;
//
//public class ProductDetailService {
//	private ProductDAO productDAO = new ProductDAO();
//	private VariantDAO variantDAO = new VariantDAO();
//	private SpecDAO specDAO = new SpecDAO();
//	private GalleryDAO galleryDAO = new GalleryDAO();
//
//    public ProductDetailService() throws SQLException, ClassNotFoundException {
//    }
//
//    public Map<String, Object> getFullProductDetail(int productId) {
//		Map<String, Object> detail = new HashMap<>();
//
//		detail.put("product", productDAO.getById(productId));
//		detail.put("variants", variantDAO.getVariantsByProductId(productId));
//		detail.put("specs", specDAO.getSpecsByProductId(productId));
//		detail.put("galleries", galleryDAO.getImagesByProductId(productId));
//
//		return detail;
//	}
//}
