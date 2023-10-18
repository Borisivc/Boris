<?php
include "include.php"; // Incluye el archivo include.php para obtener la conexión a la base de datos
//Print_r($_POST);    

// Obtén los datos de POST
$nombre = $_POST['nombre'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$correo = $_POST['correo'];
$comuna = $_POST['comuna'];
$candidato = $_POST['candidato'];
$preferencia = $_POST['preferencia'];

// Prepara la primera consulta SQL con marcadores de posición
$query1 = "INSERT INTO votante (nombre_usuario, alias, rut, email, id_comuna) VALUES (?, ?, ?, ?, ?)";

// Prepara la sentencia para la primera consulta
if ($stmt1 = $conexion->prepare($query1)) {
    // Vincula los parámetros
    $stmt1->bind_param("sssss", $nombre, $alias, $rut, $correo, $comuna);

    // Ejecuta la primera sentencia
    if ($stmt1->execute()) {
        $id_usuario = mysqli_insert_id($conexion); // Obtiene el ID generado

        echo "";
    } else {
        echo "Error al registrar los datos en la tabla 'votante': " . $stmt1->error;
    }

    // Cierra la primera sentencia
    $stmt1->close();
} else {
    echo "Error en la preparación de la primera sentencia: " . $conexion->error;
}
$preferencia = $_POST['preferencia'][0]; // Suponiendo que solo se selecciona una preferencia

// Verifica si la preferencia seleccionada existe en la tabla 'preferencia'
$query2 = "SELECT id_preferencia FROM preferencia WHERE id_preferencia = ?";

if ($stmt2 = $conexion->prepare($query2)) {
    $stmt2->bind_param("s", $preferencia);
    $stmt2->execute();
    $stmt2->store_result();

    if ($stmt2->num_rows > 0) {
        // La preferencia es válida, puedes continuar con la inserción en 'registro_votacion'
        // ... (tu código existente para la inserción en 'registro_votacion')
    } else {
        echo "La preferencia seleccionada no es válida.";
    }

    $stmt2->close();
} else {
    echo "Error en la preparación de la consulta: " . $conexion->error;
}

// Prepara la segunda consulta SQL con marcadores de posición
$query3 = "INSERT INTO registro_votacion (id_usuario, id_candidato, id_preferencia) VALUES (?, ?, ?)";

// Prepara la sentencia para la segunda consulta
if ($stmt3 = $conexion->prepare($query3)) {
    // Vincula los parámetros
    $stmt3->bind_param("sss", $id_usuario, $candidato, $preferencia);

    // Ejecuta la segunda sentencia
    if ($stmt3->execute()) {
        echo "Los datos se han registrado correctamente ";
    } else {
        echo "Error al registrar los datos en la tabla 'registro_votacion': " . $stmt3->error;
    }

    // Cierra la segunda sentencia
    $stmt3->close();
} else {
    echo "Error en la preparación de la segunda sentencia: " . $conexion->error;
}

// Cierra la conexión a la base de datos
$conexion->close();
?>
<br><br>
<button type="button" onclick="goBack()">Volver atrás</button>
<script>
    function goBack() {
        window.history.back();
    }
</script>