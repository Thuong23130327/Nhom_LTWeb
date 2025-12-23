package service;

import java.util.List;

import dao.BrandDAO;
import model.Brand;

public class BrandService {

	private BrandDAO brandDAO;

	public BrandService() {
		this.brandDAO = new BrandDAO();
	}

	public List<Brand> getAllBrands() {
		return brandDAO.getAll();
	}

}
