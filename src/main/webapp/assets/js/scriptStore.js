let total = parseInt(document.getElementById("numPage").value) || 1;

document.addEventListener("DOMContentLoaded", function () {
    renderPagination(1, total);
});

function loadMore() {
    let amount = document.getElementsByClassName("product-card").length;

    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/load",
        data: {
            exist: amount

        },
        dataType: "html",

        success: function (data) {
            console.log("Dữ liệu nhận được từ Server:");
            console.log(data);
            var row = document.getElementById("product-grid");

            if (row) {
                row.innerHTML += data; // Nối thêm sản phẩm mới vào
            } else {
                console.log("Không tìm thấy thẻ div chứa sản phẩm!");
            }
        },
        error: function (xhr, status, error) {
            // In chi tiết lỗi ra để dễ debug
            console.log("Lỗi: " + error);
            console.log("Trạng thái: " + status);
        }
    });
}

function renderPagination(current, total) {
    let html = '';
    let divPageButton = document.getElementById("pagination-buttons");
    if (total <= 1) {
        divPageButton.innerHTML = html;
        return;
    }
    total = parseInt(total);
    current = parseInt(current);
    if (current == 1) {
        html += `<button class="page-btn active" onclick="loadPage(this)" data-page="${current}">${current}</button>`;
        html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current + 1}">${current + 1}</button>`;
        html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current + 2}">${current + 2}</button>`;
        html += `<button title="Đến trang cuối" class="page-btn " onclick="loadPage(this)" data-page="${total}">>></button>`;
        divPageButton.innerHTML = html;
        return;
    }
    if (current == total) {
        html += `<button title="Về Trang đầu" class="page-btn " onclick="loadPage(this)" data-page="1"><<</button>`;
        html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current - 2}">${current - 1}</button>`;
        html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current - 1}">${current - 1}</button>`;
        html += `<button class="page-btn active" onclick="loadPage(this)" data-page="${current}">${current}</button>`;
        divPageButton.innerHTML = html;
        return;
    }

    html += `<button title="Về Trang đầu" class="page-btn " onclick="loadPage(this)" data-page="1"><<</button>`;
    html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current - 1}">${current - 1}</button>`;
    html += `<button class="page-btn active" onclick="loadPage(this)" data-page="${current}">${current}</button>`;
    html += `<button class="page-btn " onclick="loadPage(this)" data-page="${current + 1}">${current + 1}</button>`;
    html += `<button title="Đến trang cuối" class="page-btn " onclick="loadPage(this)" data-page="${total}">>></button>`;
    divPageButton.innerHTML = html;
    return;
}

function loadPage(e) {
    let page = parseInt(e.getAttribute("data-page"));
    console.log("page: " + page);
    $.ajax({
        type: "GET",
        url: path + "/loadAjax",
        data: {
            pageCurrent: page
        },
        dataType: "html",

        success: function (data) {
            console.log("Dữ liệu nhận được từ Server:");
            console.log(data);
            var row = document.getElementById("product-grid");

            if (row) {
                row.innerHTML = data;
            } else {
                console.log("Không tìm thấy thẻ div chứa sản phẩm!");
            }
        },
        error: function (xhr, status, error) {
            console.log("Lỗi: " + error);
            console.log("Trạng thái: " + status);
        }
    });
    let listButonPage = document.getElementsByClassName("page-btn");
    let tittleEle = document.getElementById("namePage");

    tittleEle.scrollIntoView({behavior: "smooth", block: "start"});

    for (const listButonPageElement of listButonPage) {
        listButonPageElement.classList.remove("active");
    }
    renderPagination(page, total);
}

let selectedBrands = [];
let selectedCates = [];

function sort(e) {
    e.classList.toggle("active");
    let parDiv = e.closest(".filter-options");
    let sortFiter = parDiv.getAttribute("data-filter-group");
    let index = -1;

    let datafilter = e.getAttribute("data-filter");
    console.log(datafilter);
    if (e.classList.contains("active")) {
        if (sortFiter == "brand") selectedBrands.push(datafilter);
        if (sortFiter == "category") selectedCates.push(datafilter);
    } else {
        if (sortFiter == "brand") {
            index = selectedBrands.indexOf(datafilter);
            selectedBrands.splice(index, 1);
        }
        if (sortFiter == "category") {
            index = selectedCates.indexOf(datafilter);
            selectedCates.splice(index, 1);
        }
    }
    $.ajax({
        type: "GET",
        url: path + "/loadAjax",
        traditional: true,
        data: {
            pageCurrent:1,
            selectedBrands: selectedBrands,
            selectedCates: selectedCates
        },
        dataType: "html",

        success: function (data) {
            console.log("Dữ liệu nhận được từ Server:");
            console.log(data);
            var row = document.getElementById("product-grid");

            if (row) {
                row.innerHTML = data;
            } else {
                console.log("Không tìm thấy thẻ div chứa sản phẩm!");
            }

        },
        error: function (xhr, status, error) {
            console.log("Lỗi: " + error);
            console.log("Trạng thái: " + status);
        }
    });

}