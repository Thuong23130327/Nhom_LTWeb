var typeSort;

function activeSortContact() {
    let allSort = document.getElementsByClassName("contact");
    for (let allSortElement of allSort) {
        if (allSortElement.getAttribute("data-sort") != typeSort)
            allSortElement.classList.remove("active");
        else allSortElement.classList.add("active");
    }

}

function sortContact(e) {
    typeSort = e.getAttribute("data-sort");
    loadContact();
    activeSortContact();
}


function loadContact() {
    $.ajax({
        type: "GET",
        url: (typeof path !== 'undefined' ? path : "") + "/contact-Ajax",
        traditional: true,
        data: {
            search: 1,
            selectedSort: typeSort == null ? "new" : typeSort,

        },
        dataType: "html",

        success: function (data) {
            var row = document.getElementById("contact-content");
            if (row) row.innerHTML = data;
        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX: " + error);
        }
    });
}

