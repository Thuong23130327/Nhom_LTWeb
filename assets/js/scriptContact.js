document.addEventListener('DOMContentLoaded', function() {
            const sendButton = document.querySelector('.send-btn');
            const contactForm = sendButton ? sendButton.closest('form') : null;

            if (contactForm) {
                contactForm.addEventListener('submit', function(event) {
                    event.preventDefault();

                    // Thông báo

                    alert("Vấn đề của bạn đã được gửi, chúng tôi sẽ xem xét và phản hồi trong thời gian sớm nhất.");
                    
                    contactForm.reset(); 
                });
            }
        });