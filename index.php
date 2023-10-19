<?php
include "include.php";
?>
<!DOCTYPE html>
<html>

<head>
    <style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
        }

        .checkbox-group label {
            margin-right: 20px;
        }
    </style>
</head>

<body>
    <div class="card">
        <h1>Formulario de Votación</h1>
        <form action="grabar.php" method="post">
            <label>Nombre:</label><br>
            <input type="text" name="nombre" required><br>

            <label>Alias:</label><br>
            <input type="text" name="alias" id="alias" required><br>

            <label>RUT:</label><br>
            <input type="text" name="rut" placeholder="Rut sin puntos ni guion" required><br>

            <label>Email:</label><br>
            <input type="email" name="correo" placeholder="correo@gmail.com" required><br>

            <label>Region:</label>&nbsp&nbsp&nbsp&nbsp&nbsp
            <select name="region" id="region" required>
                <option value="">Seleccione una región</option>
                <?php
                include "include.php"; // Incluye la conexión a la base de datos
                
                $query = "select * from region order by nombre_region";
                $res_region = mysqli_query($conexion, $query);
                while ($row = mysqli_fetch_object($res_region)) {
                    echo "<option value='" . $row->id_region . "'>" . $row->nombre_region . "</option>";
                }
                mysqli_free_result($res_region);
                ?>
            </select><br>

            <label>Comuna:</label>&nbsp&nbsp&nbsp
            <select name="comuna" id="comuna" required>
                <option></option>
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
            <div class="checkbox-group">
                <?php
                $query = "select * from preferencia order by descripcion";
                $res_preferencia = mysqli_query($conexion, $query);

                while ($row = mysqli_fetch_object($res_preferencia)) {
                    echo '<label><input type="checkbox" name="preferencia[]" value="' . $row->id_preferencia . '"> ' . $row->descripcion . '</label>';
                }

                mysqli_free_result($res_preferencia);
                ?>
            </div>
            <br>

            <input type="submit" class="btn btn-success" value="Enviar">
            <input type="reset" value="Limpiar">
        </form>
    </div>
    <script>
        // Evento onchange para el select de Región
        document.getElementById("region").onchange = function () {
            var regionId = this.value;
            var comunaSelect = document.getElementById("comuna");
            comunaSelect.innerHTML = "<option value=''>Seleccione una comuna</option>";

            if (regionId !== "") {
                // Realizar una solicitud AJAX para obtener las comunas de la región seleccionada
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "get_comunas.php?region=" + regionId, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var comunas = JSON.parse(xhr.responseText);
                        comunas.forEach(function (comuna) {
                            var option = document.createElement("option");
                            option.value = comuna.id_comuna;
                            option.textContent = comuna.nombre_comuna;
                            comunaSelect.appendChild(option);
                        });
                    }
                };
                xhr.send();
            }
        };
    </script>
    <script>
        document.getElementById("alias").addEventListener("blur", function () {
            var alias = this.value;
            var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,}$/; // Expresión regular para validar al menos 5 caracteres alfanuméricos con letras y números
            if (!regex.test(alias)) {
                alert("El alias debe contener al menos 5 caracteres con letras y números.");
                this.value = ''; // Limpiar el campo si no cumple con la validación
            }
        });
    </script>

</body>

</html>