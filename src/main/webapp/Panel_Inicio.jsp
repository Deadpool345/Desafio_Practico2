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
<body >

    <h1 class="text-2xl mb-4">Panel de Administración</h1>
    <p class="mb-4">¡Bienvenido, <%= session.getAttribute("username") %>!</p>
    <form action="logout" method="post">
        <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Cerrar Sesión</button>
    </form>

</body>
</html>
