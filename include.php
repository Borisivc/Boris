<?php
$servidor = "localhost";
$usuario = "borisivc";
$contrasena = 77454419;
$basededatos = "empresa";
global $conexion;
$conexion = new mysqli($servidor, $usuario, $contrasena, $basededatos);

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);

}
?>