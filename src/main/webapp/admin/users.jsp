<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "QUẢN LÝ ĐƠN - AuraSound");
    request.setAttribute("keepDefaultCss", true);
%>
<c:set var="customCss">
    <link rel="stylesheet" href="/assets/css/styleAdmin.css">
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
                                    <th>#</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Nguyễn Hoài Thương</td>
                                    <td>23130327@st.hcmuaf.edu.vn</td>
                                    <td>
                                        <span class="badge bg-danger">Quản trị viên</span>
                                    </td>
                                    <td>
                                        <a href="../profileM/profile.jsp"><button class="btn btn-sm btn-info">Xem</button></a>
                                        <a href="../404.jsp"><button class="btn btn-sm btn-warning">Sửa</button></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>Vũ Châu Hoài Phong</td>
                                    <td>23130238@st.hcmuaf.edu.vn</td>
                                    <td>
                                        <span class="badge bg-primary">Khách hàng</span>
                                    </td>
                                    <td>
                                        <a href="../profileM/profile.jsp"><button class="btn btn-sm btn-info">Xem</button></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>Thòng Lý Tiểu Yến</td>
                                    <td>23130397@st.hcmuaf.edu.vn</td>
                                    <td>
                                        <span class="badge bg-primary">Khách hàng</span>
                                    </td>
                                    <td>
                                        <a href="../profileM/profile.jsp"><button class="btn btn-sm btn-info">Xem</button></a>
                                    </td>
                                </tr>
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
