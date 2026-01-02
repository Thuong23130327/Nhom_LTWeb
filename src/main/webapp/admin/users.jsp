<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%
    int userId = request.getAttribute("id") == null ? 0 : (int) request.getAttribute("id");
    String userEmail = request.getAttribute("email") == null ? "" : request.getAttribute("email") + "";
    String fullName = request.getAttribute("fullName") == null ? "" : request.getAttribute("fullName") + "";
    String passHash = request.getAttribute("password_hash") == null ? "" : request.getAttribute("password_hash") + "";
    String userRole = request.getAttribute("role") == null ? "" : request.getAttribute("role") + "";
    boolean lockedStatus = request.getAttribute("is_locked") != null && (boolean) request.getAttribute("is_locked");
    Timestamp timeCreated = (Timestamp) request.getAttribute("created_at");

    List<User> userList = (List<User>) request.getAttribute("userList");
%>
%>
<%
    request.setAttribute("pageTitle", "QUẢN LÝ ĐƠN - AuraSound");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleAdmin.css">
</c:set>
<%@ include file="/_header.jsp" %>

    <!-- section -->

    <div class="container-fluid">
        <div class="row">


            <%@ include file="/admin/_adminMenu.jsp" %>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2"><i class="fas fa-users"></i> Quản lý Người dùng</h1>
                </div>

                <p class="text-muted">Đây là khu vực quản lý tài khoản người dùng, chỉnh sửa, khóa hoặc xem chi tiết hoạt động.</p>
                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${userList}" var="u">
                                    <tr>
                                        <td>${u.id}</td>
                                        <td>${u.fullName}</td>
                                        <td>${u.email}</td>
                                        <td>
                                                <%-- Kiểm tra vai trò dựa trên ENUM Role --%>
                                            <c:choose>
                                                <c:when test="${u.role == 'Admin'}">
                                                    <span class="badge bg-danger">Quản trị viên</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-primary">Khách hàng</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${u.locked}">
                                                <span class="text-danger"><i class="fas fa-lock"></i> Đã khóa</span>
                                            </c:if>
                                            <c:if test="${!u.locked}">
                                                <span class="text-success"><i class="fas fa-check-circle"></i> Hoạt động</span>
                                            </c:if>
                                        </td>
                                        <td>${u.createdAt}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/profileM/profile.jsp?id=${u.id}">
                                                <button class="btn btn-sm btn-info">Xem</button>
                                            </a>
                                            <c:if test="${u.role != 'Admin'}">
                                                <a href="${pageContext.request.contextPath}/404.jsp?id=${u.id}">
                                                    <button class="btn btn-sm btn-warning">Sửa</button>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/scriptAdmin.js"></script>
    <script src="../assets/js/scriptProfile.js"></script>
</body>

</html>
