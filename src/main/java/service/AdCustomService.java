package service;

import dao.BannerDAO;
import dao.BrandDAO;
import model.Banner;

import java.util.List;

public class AdCustomService {
    BannerDAO bannerDAO = new BannerDAO();

    public List<Banner> getListBanner() {
        return bannerDAO.getListBanner();

    }
}
