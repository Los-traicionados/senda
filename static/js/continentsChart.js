var ctxcontinent = document.getElementById('continents').getContext('2d');
    var continents = new Chart(ctxcontinent, {
    type: 'doughnut',
    data: {
        labels: ['Europa', 'América', 'Asia', 'Oceanía', 'África'],
        datasets: [{
            label: 'Reservas por continentes',
            data: [170, 210, 51, 47, 47],
            backgroundColor: [
                COLOR.ORANGE,
                COLOR.GREYM,
                COLOR.RED,
                COLOR.GREYT,
                COLOR.GREEN,
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        legend: { display: true, position: 'right', },
        title: {
            display: true,
            text: 'Reservas por continentes'
        },
        animation: {
            animateScale: true,
            animateRotate: true
        }
    }
});