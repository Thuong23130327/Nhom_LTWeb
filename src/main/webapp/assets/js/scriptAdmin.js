function updateOrderStatus(orderId) {
    const old = document.getElementById("statusDropdown").getAttribute("data-current");
    const statusSelect = document.getElementById("statusDropdown");
    const newStatus = statusSelect.value;
    let cancelReason = "";

    if (newStatus === "Cancelled") {
        cancelReason = prompt("Vui lòng nhập lý do hủy đơn hàng này: ");

        if (cancelReason === null) {
            statusSelect.value = old;
            return;
        }
        if (cancelReason.trim() === "") {
            alert("Bạn phải nhập lý do khi hủy đơn!");
            statusSelect.value = old;
            return;
        }
    }
    if (confirm("Bạn có chắc chắn muốn chuyển sang trạng thái " + newStatus + " không?")) {
        $.ajax({
            url: path + "/admin/update-order-status",
            type: "POST",
            data: {
                id: orderId,
                status: newStatus
            },
            success: function (response) {
                if (response.trim() == "true") {
                    alert("Cập nhật trạng thái thành công !");
                    location.reload();
                } else {
                    alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
                }
            },
            error: function () {
                alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
            }
        });
        updateAdNote(orderId,cancelReason);
    }
}

function updateAdNote(orderId,newNote) {
    $.ajax({
        url: path + "/admin/update-admin-note",
        type: "POST",
        data: {
            id: orderId,
            status: newNote
        },
        success: function (response) {
            if (response.trim() == "true") {
                alert("Cập nhật thành công !");
                location.reload();
            } else {
                alert("Update note thành công");
            }
        },
        error: function () {
            alert("Có lỗi khi update note!");
        }
    });
}

function saveAdminNote(orderId) {
    const newNote = document.getElementById("adminNote").value;
    if (confirm("Bạn có chắc muốn update Ghi chú mới của admin chứ? ")) {
        updateAdNote(orderId, newNote);
    }
}

