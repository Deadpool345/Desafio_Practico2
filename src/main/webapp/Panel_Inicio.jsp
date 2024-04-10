<%--
  Created by IntelliJ IDEA.
  User: steve
  Date: 8/4/2024
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-200">
<div class="flex h-screen">
    <div class="w-64 bg-blue-400 text-gray-200 rounded  p-6">
        <h1 class="text-2xl mb-4">Bienvenido, Admin</h1>
        <ul>
            <li class="mb-2"><button class="w-full rounded bg-gray-700 hover:bg-gray-600 p-2 text-center">Agregar Alumno</button></li>
            <li class="mb-2"><button class="w-full rounded bg-gray-700 hover:bg-gray-600 p-2 text-center">Agregar Materia</button></li>
            <li class="mb-2"><button class="w-full rounded bg-gray-700 hover:bg-gray-600 p-2 text-center">Editar Alumno</button></li>
            <li class="mb-2"><button class="w-full rounded bg-gray-700 hover:bg-gray-600 p-2 text-center">Editar Materia</button></li>
            <li class="mb-2"><button class="w-full rounded bg-gray-700 hover:bg-gray-600 p-2 text-center">Inscribir Alumno</button></li>
            <form action="logout" method="post">
                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Cerrar Sesión</button>
            </form>

        </ul>
    </div>
    <div class="flex-1 p-6">
        <!-- Aquí va el contenido principal -->
    </div>
</div>
</body>
</html>
