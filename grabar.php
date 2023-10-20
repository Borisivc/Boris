<?php
include "include.php"; // Incluye el archivo include.php para obtener la conexión a la base de datos

// Función para validar el RUT
function validarRut($rut)
{
    $rut = preg_replace('/[^0-9kK]/', '', $rut); // Elimina caracteres no válidos
    if (empty($rut)) {
        return false;
    }

    $dv = strtoupper(substr($rut, -1));
    $rut = substr($rut, 0, -1);

    $factor = 2;
    $suma = 0;

    for ($i = strlen($rut) - 1; $i >= 0; $i--) {
        $suma += $rut[$i] * $factor;
        $factor = $factor == 7 ? 2 : $factor + 1;
    }

    $dvEsperado = 11 - ($suma % 11);

    if ($dvEsperado == 10) {
        $dvEsperado = 'K';
    }

    if ($dvEsperado == 11) {
        $dvEsperado = '0';
    }

    return $dv == $dvEsperado;
}

// Obtén los datos de POST
$nombre = $_POST['nombre'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$correo = $_POST['correo'];
$comuna = $_POST['comuna'];
$candidato = $_POST['candidato'];
$preferencias = $_POST['preferencia'];

// Validar el RUT
if (!validarRut($rut)) {
    echo "El RUT no es válido. Por favor, ingresé un RUT válido.";
    // Puedes hacer un redireccionamiento o mostrar un mensaje de error adecuado
} else {
    // Prepara la primera consulta SQL con marcadores de posición
    $query1 = "INSERT INTO votante (nombre_usuario, alias, rut, email, id_comuna) VALUES (?, ?, ?, ?, ?)";

    // Prepara la sentencia para la primera consulta
    if ($stmt1 = $conexion->prepare($query1)) {
        // Vincula los parámetros
        $stmt1->bind_param("sssss", $nombre, $alias, $rut, $correo, $comuna);

        // Ejecuta la primera sentencia
        if ($stmt1->execute()) {
            $id_usuario = mysqli_insert_id($conexion); // Obtiene el ID generado
        } else {
            echo "Error al registrar los datos en la tabla 'votante': " . $stmt1->error;
        }

        // Cierra la primera sentencia
        $stmt1->close();
    } else {
        echo "Error en la preparación de la primera sentencia: " . $conexion->error;
    }

    // Verifica si las preferencias seleccionadas existen en la tabla 'preferencia'
    $validPreferences = array();

    $query2 = "SELECT id_preferencia FROM preferencia WHERE id_preferencia = ?";
    if ($stmt2 = $conexion->prepare($query2)) {
        foreach ($preferencias as $preferenciaId) {
            $stmt2->bind_param("s", $preferenciaId);
            $stmt2->execute();
            $stmt2->store_result();

            if ($stmt2->num_rows > 0) {
                $validPreferences[] = $preferenciaId;
            }
        }

        $stmt2->close();
    } else {
        echo "Error en la preparación de la consulta: " . $conexion->error;
    }

    if (count($validPreferences) > 0) {
        // Prepara la consulta SQL para la inserción en 'registro_votacion' para cada preferencia válida
        $query3 = "INSERT INTO registro_votacion (id_usuario, id_candidato, id_preferencia) VALUES (?, ?, ?)";

        if ($stmt3 = $conexion->prepare($query3)) {
            foreach ($validPreferences as $preferenciaId) {
                // Vincula los parámetros
                $stmt3->bind_param("sss", $id_usuario, $candidato, $preferenciaId);

                // Ejecuta la segunda sentencia para cada preferencia válida
                if ($stmt3->execute()) {
                    // Continuar con otro proceso o mensaje de éxito
                } else {
                    echo "Error al registrar los datos en la tabla 'registro_votacion': " . $stmt3->error;
                }
            }

            // Cierra la segunda sentencia
            $stmt3->close();
        } else {
            echo "Error en la preparación de la segunda sentencia: " . $conexion->error;
        }
    } else {
        echo "Ninguna de las preferencias seleccionadas es válida.";
    }
    echo "GRACIAS POR REALIZAR SU VOTACIÓN ";
    // Cierra la conexión a la base de datos
    $conexion->close();
}

?>
<br><br><a href="index.php"><button type="button">Volver a la página de inicio</button></a>