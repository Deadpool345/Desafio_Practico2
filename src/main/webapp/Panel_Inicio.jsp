<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-200">
<div class="flex h-full">
    <div class="w-64 bg-blue-400 text-gray-200 rounded  p-6">
        <h1 class="text-2xl mb-4">Bienvenido, <%= session.getAttribute("username") %></h1>
        <ul class="mt-[3.5rem]">
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('AgregarAlumno.jsp')">Agregar Alumno</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('AgregarMateria.jsp')">Agregar Materia</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('EditarAlumno.jsp')">Editar Alumno</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('EditarMateria.jsp')">Editar Materia</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('InscribirAlumno.jsp')">Inscribir Alumno</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('EliminarInscripcion.jsp')">Eliminar Inscripción</button></li>
            <li class="mb-[1.5rem]"><button class="w-full h-[3rem] rounded-[1.5rem] bg-gray-700 hover:bg-gray-600 p-2 text-center" onclick="loadContent('InscripcionDetalle.jsp')">Detalles Inscripción</button></li>
            <form action="logout" method="post" class="flex justify-center">
                <button type="submit" class="bg-red-500 text-white px-4 py-2 h-[3rem] rounded-[1.5rem] hover:bg-red-600">Cerrar Sesión</button>
            </form>

        </ul>
    </div>
    <div class="flex-1 p-6" id="content">
        <!-- Aquí va el contenido principal -->
    </div>
    <script>
        window.onload = function() {
            // Cargar la página por defecto al acceder al panel de administración
            loadContent('AgregarAlumno.jsp');
        };

        function loadContent(page) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("content").innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", page, true);
        xhttp.send();
    }
    </script>
</div>
</body>
</html>
