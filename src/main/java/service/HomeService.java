package service;

import dao.BannerDAO;
import dao.BrandDAO;
import model.Banner;
import model.Brand;

import java.sql.SQLException;
import java.util.List;

public class HomeService {
    BannerDAO bannerDAO = new BannerDAO();
    BrandDAO brandDAO = new BrandDAO();

    public List<Banner> getListBanner() {
        return bannerDAO.get3ListBanner();
    }

    public List<Brand> getListBrands() throws SQLException, ClassNotFoundException {
        return brandDAO.getAll();
    }
}
