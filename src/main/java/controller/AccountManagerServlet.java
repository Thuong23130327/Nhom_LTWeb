package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountManagerServlet", value = "/admin/user-manager")
public class AccountManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// Kiểm tra phân quyền của tài khoản
        HttpSession session = request.getSession();
        User authUser = (User) session.getAttribute("auth");

        if (authUser == null || authUser.getRole() != User.Role.Admin) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

// Lấy dữ liệu từ DAO
        UserDAO dao = new UserDAO();
        List<User> userList = dao.getAllUser();

// Đẩy danh sách vào request
        request.setAttribute("userList", userList);

// Forward đến user.jsp
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
