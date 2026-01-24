<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {

        const labels = [<c:forEach var="entry" items="${stats.sevenDaysRevenue}">"${entry.key}",</c:forEach>];
        const dataValues = [<c:forEach var="entry" items="${stats.sevenDaysRevenue}">${entry.value},</c:forEach>];

        const ctx = document.getElementById('revenueBarChart');

        if (ctx) {
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Doanh thu (VNĐ)',
                        data: dataValues,
                        backgroundColor: '#4a6fff',
                        hoverBackgroundColor: '#b76bff',
                        borderRadius: 5
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function(value) {
                                    return value.toLocaleString('vi-VN') + ' ₫';
                                }
                            }
                        }
                    }
                }
            });
        }
    });
</script>