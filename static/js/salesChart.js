var ctxsales = document.getElementById('salesChart').getContext('2d');
var salesChart = new Chart(ctxsales, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [{
            label: 'Volumen de ventas anual',
            data: [1, 19, 3, 5, 2, 3, 7, 8, 12, 5, 6, 4],
            backgroundColor: COLOR.ORANGE,
            borderRadius: 8,
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});