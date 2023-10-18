<?php
include "include.php";

if (isset($_GET['region'])) {
    $regionId = $_GET['region'];

    // Realiza una consulta SQL para obtener las comunas de la región
    $query = "SELECT * FROM comuna WHERE id_region = ? order by nombre_comuna";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param("i", $regionId);
    $stmt->execute();
    $result = $stmt->get_result();

    $comunas = array();

    while ($row = $result->fetch_assoc()) {
        $comuna = array(
            'id_comuna' => $row['id_comuna'],
            'nombre_comuna' => $row['nombre_comuna']
        );
        $comunas[] = $comuna;
    }

    header('Content-Type: application/json');
    echo json_encode($comunas);
}
?>
