package service;

import dao.CategoryDao;
import model.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {
    CategoryDao categoryDao = new CategoryDao();

    public List<Category> getAllCategories() throws SQLException, ClassNotFoundException {
        return categoryDao.getAllCategories();
    }

    public Category getCategoryById(int cateId) throws SQLException, ClassNotFoundException {
        List<Category> categoryList = categoryDao.getAllCategories();
        for (Category category : categoryList) {
            if (category.getId() == cateId) return category;
        }
        return null;

    }

    public boolean isParent(Category c) {
        return c.getParentID() == 0;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        CategoryService categoryService = new CategoryService();
        System.out.println(categoryService.getAllCategories());
    }

}
