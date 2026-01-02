package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

//@WebFilter(urlPatterns = "/admin/*", description = "filter cho login")

public class AdminRoleFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("auth");

        if (user != null && user.getRole() == User.Role.Admin) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
