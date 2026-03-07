function updateOrderStatus(orderId) {
    const old = document.getElementById("statusDropdown").getAttribute("data-current");
    const statusSelect = document.getElementById("statusDropdown");
    const newStatus = statusSelect.value;
    let cancelReason = "";
    const newNote = document.getElementById("adminNote").value;

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
            url: path + "/admin/order",
            type: "POST",
            data: {
                action: "updateStatus",
                id: orderId,
                status: newStatus
            },
            success: function (response) {
                if (response.trim() == "true") {
                    autoSaveNote(orderId, newNote);
                } else {
                    alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
                }
            },
            error: function () {
                alert("Có lỗi xảy ra khi Update trạng thái, vui lòng thử lại !");
            }
        });
    }
}

function autoSaveNote(orderId, newNote) {
    $.ajax({
        url: path + "/admin/order",
        type: "POST",
        data: {
            action: "updateNote",
            id: orderId,
            status: newNote
        },
        success: function (response) {
            alert("Cập nhật trạng thái và ghi chú thành công!");
            location.reload();
        },
        error: function () {
            alert("Trạng thái đã cập nhật nhưng có lỗi khi lưu ghi chú!");
            location.reload();
        }
    });
}


function updateAdNote(orderId) {
    const newNote = document.getElementById("adminNote").value;
    if (confirm("Bạn có chắc muốn update Ghi chú mới của admin chứ? ")) {
        $.ajax({
            url: path + "/admin/order",
            type: "POST",
            data: {
                action: "updateNote",
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
}

