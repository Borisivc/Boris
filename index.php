<?php
include "include.php"
    ?>
<!DOCTYPE html>
<html>

<head>

    <h1>Formulario de Votación</h1>
</head>

<body>
    <div style="display:inline">
        <form action="grabar.php" method="post">
            <label>Nombre:</label><br>
            <input type="text" name="nombre" required><br>

            <label>Alias:</label><br>
            <input type="text" name="alias" required><br>

            <label>RUT:</label><br>
            <input type="text" name="rut" placeholder="Rut sin puntos ni guion" required><br>

            <label>Email:</label><br>
            <input type="email" name="correo" placeholder="correo@gmail.com" required><br>
            <!--
        <label>Region:</label>&nbsp&nbsp&nbsp&nbsp&nbsp
        <select name="region" id="region" required>
            <option></option>
            <?php
            $query = "select * from region order by nombre_region";
            $res_region = mysqli_query($conexion, $query);
            while ($row = mysqli_fetch_object($res_region)) {
                echo "<option value='" . $row->id_region . "'>" . $row->nombre_region . "</option>";
            }
            mysqli_free_result($res_region);
            ?>
        </select><br>
        -->
            <label>Comuna:</label>&nbsp&nbsp&nbsp
            <select name="comuna" id="comuna" required>
                <option></option>
                <?php
                $query = "select * from comuna order by nombre_comuna";
                $res_comuna = mysqli_query($conexion, $query);
                while ($row = mysqli_fetch_object($res_comuna)) {
                    echo "<option value='" . $row->id_comuna . "'>" . $row->nombre_comuna . "</option>";
                }
                mysqli_free_result($res_comuna);
                ?>
            </select><br>

            <label>Candidato:</label>
            <select name="candidato" id="candidato" required>
                <option></option>
                <?php
                $query = "select * from candidato order by nombre_candidato";
                $res_candidato = mysqli_query($conexion, $query);
                while ($row = mysqli_fetch_object($res_candidato)) {
                    echo "<option value='" . $row->id_candidato . "'>" . $row->nombre_candidato . "</option>";
                }
                mysqli_free_result($res_candidato);
                ?>
            </select><br><br>

            <label>Como se enteró de nosotros:</label><br>
            <?php
            $query = "select * from preferencia order by descripcion";
            $res_preferencia = mysqli_query($conexion, $query);

            while ($row = mysqli_fetch_object($res_preferencia)) {
                echo '<input type="radio" name="preferencia" value="' . $row->id_preferencia . '"> ' . $row->descripcion . '<br>';
            }

            mysqli_free_result($res_preferencia);
            ?>
            <br>

            <input type="submit" class="btn btn-success" value="Enviar">
            <input type="reset" value="Limpiar">
        </form>
    </div>


</body>

</html>