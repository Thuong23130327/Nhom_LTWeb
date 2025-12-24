 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="assets/css/styleHome.css">
    <link rel="stylesheet" href="assets/css/styleProfile.css">
    <link rel="stylesheet" href="assets/css/styleStore.css">
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 <%
     request.setAttribute("pageTitle", "Sản phẩm - AuraSound");
     request.setAttribute("activePage", "product");
     request.setAttribute("keepDefaultCss", true);
 %>
 <c:set var="customCss">
     <link rel="stylesheet" href="assets/css/styleProduct.css">
     <link rel="stylesheet" href="assets/css/styleCheckout.css">
 </c:set>
 <%@ include file="_header.jsp" %>

    <main class="store-container content">
        <h1>Sản Phẩm</h1>

        <div class="store-controls" id="filter-buttons">
            <a href="store.jsp"><button class="filter-btn active">Tất cả</button></a>
            <a href="headphones.jsp"><button class="filter-btn">Tai Nghe</button></a>
            <a href="speakers.jsp"><button class="filter-btn">Loa</button></a>
        </div>

        <div class="product-grid" id="product-grid">
            <a href="sproduct.jsp" class="product-card tai-nghe page-1">
                <div class="product-badge discount">
                    Giảm 18%
                </div>
                <img src="https://salt.tikicdn.com/cache/750x750/ts/product/ac/cf/71/908237eb3f6dfd93ee494866616de085.jpg.webp"
                    alt="Sony WH-1000XM5">

                <div class="product-card-info">
                    <h4>Sony WH-1000XM5</h4>
                    <div class="price-block">
                        <span class="new-price">7.990.000đ</span>
                        <span class="old-price">9.690.000đ</span>
                    </div>
                    <div class="product-bottom-row">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span>4.7</span>
                        </div>
                        <div class="favorite">
                            <i class="bi bi-heart"></i>
                            <i class="bi bi-heart-fill"></i>
                            <span>Yêu thích</span>
                        </div>
                    </div>
                </div>
            </a>

           <c:forEach items="${products}" var="p">
                   <a href="sproduct.jsp" class="product-card">
                       <div class="product-badge discount">
                           Giảm 50%
                       </div>
                       <img src="https://www.winwinstore.vn/wp-content/uploads/2021/08/loa-bluetooth-sony-srs-xb13-black-8.jpeg"
                           alt="Loa bluetooth Sony SRS-XB13">
                       <div class="product-card-info">
                           <h4>${p.name}</h4>
                           <div class="price-block">
                               <span class="new-price">645.000đ</span>
                               <span class="old-price">1.290.000đ</span>
                           </div>
                       <div class="product-bottom-row">
                            <div class="rating">
                                 <i class="bi bi-star-fill"></i>
                                 <span>${p.avgRating}</span>
                            </div>
                       		<div class="favorite">
                                  <i class="bi bi-heart"></i> <i class="bi bi-heart-fill"></i>
                                  <span>Yêu thích</span>
                               </div>
                           </div>
                       </div>
                   </a>
           </c:forEach>
        </div>
    </main>

 <%@ include file="_footer.jsp" %>

</body>

</html>