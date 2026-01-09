package service;

import java.sql.SQLException;
import java.util.List;

import dao.BrandDAO;
import model.Brand;

public class BrandService {

    private BrandDAO brandDAO;

    public BrandService() {
        this.brandDAO = new BrandDAO();
    }

    public List<Brand> getAllBrands() throws SQLException, ClassNotFoundException {
        return brandDAO.getAll();
    }

    public Brand getBrandsById(String id) throws SQLException, ClassNotFoundException {
        return brandDAO.getById(id);
    }

}
