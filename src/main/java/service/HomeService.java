package service;

import dao.BannerDAO;
import dao.BrandDAO;
import dao.ProductDAO;
import model.Banner;
import model.Brand;
import model.Product;

import java.sql.SQLException;
import java.util.List;

public class HomeService {
    BannerDAO bannerDAO = new BannerDAO();
    BrandDAO brandDAO = new BrandDAO();
    ProductDAO productDAO = new ProductDAO();

    public List<Banner> getListBanner() {
        return bannerDAO.get3ListBanner();
    }

    public List<Product> getFeaturedProducts(int limit) {
        return productDAO.getFeaturedProducts(limit);
    }


    public List<Brand> getListBrands() throws SQLException, ClassNotFoundException {
        return brandDAO.getAll();
    }
}
