var bar = document.getElementById('reservations').getContext('2d');
var barChart = new Chart(bar, {
type: 'bar',
data: {
    labels: ['Finalizadas', 'Pendientes', 'Canceladas'],
    datasets: [{
        label: 'Reservas',
        data: [515, 215, 85],
        backgroundColor: '#EB5E37',
            borderRadius: 8,
        borderWidth: 1
    }]
},
options: {
    indexAxis: 'y',
    scales: {
        xAxes: [{
            ticks: { beginAtZero: true }
        }]
    },
    legend: { display: true },
    title: { display: true, text: 'Reservas' }
}
});