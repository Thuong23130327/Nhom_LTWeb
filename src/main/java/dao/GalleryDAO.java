package dao;

import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {
	public List<String> getImagesByProductId(int productId) {
		List<String> images = new ArrayList<>();
		String sql = "SELECT image_url FROM ProductGalleries WHERE Products_id = ?";
		return images;
	}
}
