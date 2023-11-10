document.addEventListener('DOMContentLoaded', function() {
    var campos = document.querySelectorAll('.input-campo');

    campos.forEach(function(campo) {
        campo.addEventListener('focus', function() {
            campo.parentElement.querySelector('.label-placeholder').style.opacity = '0';
        });

        campo.addEventListener('blur', function() {
            if (campo.value.trim() === '') {
                campo.parentElement.querySelector('.label-placeholder').style.opacity = '1';
            }
        });
    });

    var contrasena = document.getElementById('contrasena');
    var confirmarContrasena = document.getElementById('confirmar_contrasena');

    function validarContrasenas() {
        if (contrasena.value !== confirmarContrasena.value) {
            confirmarContrasena.setCustomValidity('Las contraseñas no coinciden');
        } else {
            confirmarContrasena.setCustomValidity('');
        }
    }

    contrasena.addEventListener('input', validarContrasenas);
    confirmarContrasena.addEventListener('input', validarContrasenas);
});