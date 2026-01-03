package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HeaderServlet", value = "/Header")
public class HeaderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        List<Category> categoryList = new ArrayList();
        List<Category> parentList = new ArrayList();
        List<Category> childList = new ArrayList();
        try {
            categoryList = categoryService.getAllCategories();
            for (Category category : categoryList) {
                if (categoryService.isParent(category)) {
                    parentList.add(category);
                } else {
                    childList.add(category);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("parentList", parentList);
        request.setAttribute("childList", childList);

        request.getRequestDispatcher("/_header.jsp").include(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }
}