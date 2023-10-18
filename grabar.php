<?php
include "include.php"; // Incluye el archivo include.php para obtener la conexión a la base de datos

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

// Prepara la segunda consulta SQL con marcadores de posición
$query2 = "INSERT INTO registro_votacion (id_usuario, id_candidato, id_preferencia) VALUES (?, ?, ?)";

// Prepara la sentencia para la segunda consulta
if ($stmt2 = $conexion->prepare($query2)) {
    // Vincula los parámetros
    $stmt2->bind_param("sss", $id_usuario, $candidato, $preferencia);

    // Ejecuta la segunda sentencia
    if ($stmt2->execute()) {
        echo "Los datos se han registrado correctamente ";
    } else {
        echo "Error al registrar los datos en la tabla 'registro_votacion': " . $stmt2->error;
    }

    // Cierra la segunda sentencia
    $stmt2->close();
} else {
    echo "Error en la preparación de la segunda sentencia: " . $conexion->error;
}

// Cierra la conexión a la base de datos
$conexion->close();
?>
<br>
<a href="javascript: history.go(-1)">Volver atrás</a>
