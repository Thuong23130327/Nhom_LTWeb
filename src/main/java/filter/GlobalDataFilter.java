package filter;

import jakarta.persistence.criteria.Fetch;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Brand;
import model.Category;
import service.BrandService;
import service.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GlobalDataFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        List<Brand> brandList = new  ArrayList<>();
        if (session.getAttribute("brandList") == null) {
            BrandService brandService = new BrandService();
            brandList = null;
            try {
                brandList = brandService.getAllBrands();
                session.setAttribute("brandList", brandList);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if (session.getAttribute("parentList") == null) {
            CategoryService categoryService = new CategoryService();
            List<Category> categoryList = new  ArrayList<>();
            List<Category> parentList = new  ArrayList<>();
            List<Category> childList = new  ArrayList<>();
            try {
                categoryList = categoryService.getAllCategories();
                for (Category category : categoryList) {
                    if (categoryService.isParent(category)) {
                        parentList.add(category);
                    } else {
                        childList.add(category);
                    }
                }


                session.setAttribute("categoryList", categoryList);
                session.setAttribute("parentList", parentList);
                session.setAttribute("childList", childList);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }
        session.setAttribute("AuraSound", request.getContextPath());
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
