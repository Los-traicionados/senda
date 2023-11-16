var ctxemploy = document.getElementById('employeeChart').getContext('2d');
var employeeChart = new Chart(ctxemploy, {
    type: 'bar',
    data: {
        labels: ['Online', 'Juan Gomez', 'Pablo Garcia', 'Roberto Perez'],
        datasets: [{
            label: 'Facturación empleados',
            data: [170000, 19000, 15000, 6000],
            backgroundColor: COLOR.GREEN,
            borderRadius: 6
        }]
    },
    options: {
        indexAxis: 'y',
        scales: {
            x: {
                ticks: {
                    beginAtZero: true,
                    callback: function(value, index, values) {
                        return value.toLocaleString("es-ES", {style:"currency", currency:"EUR"});
                    }
                }
            }
        },
        plugins: {
            legend: { display: true },
            title: { display: true, text: 'Facturación empleados' }
        }
    }
});