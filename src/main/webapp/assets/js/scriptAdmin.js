document.addEventListener('DOMContentLoaded', function() {
    const updateButton = document.querySelector('.btn-toolbar button i.fa-sync-alt').parentElement;

    if (updateButton) {
        updateButton.addEventListener('click', function(event) {
            event.preventDefault(); 

            // Hiển thị thông báo cập nhật dữ liệu

            alert('Dữ liệu đã được cập nhật');
        });
    }
});