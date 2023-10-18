$(document).ready(function () {
    // Cuando cambia la selección de región
    $('#region').on('change', function () {
        var regionId = $(this).val();

        // Realiza una solicitud AJAX al servidor para obtener las comunas de la región seleccionada
        $.ajax({
            type: 'POST',
            url: 'load_comunas.php', // Este archivo PHP manejará la obtención de las comunas
            data: { regionId: regionId },
            success: function (data) {
                // Actualiza el select de comunas con las opciones recibidas del servidor
                $('#comuna').html(data);
            }
        });
    });
});
