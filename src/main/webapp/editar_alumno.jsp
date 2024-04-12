<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Alumno</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-4">
<h1 class="text-4xl text-center mb-[2rem]">Editar Alumno</h1>

<%
    String carnet = request.getParameter("carnet");
    PrintWriter a = response.getWriter();

    if (carnet == null || carnet.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
        Statement statement = connection.createStatement();

        String query = "SELECT * FROM alumnos WHERE Carnet = '" + carnet + "'";
        ResultSet resultSet = statement.executeQuery(query);

        if (!resultSet.next()) {
            response.sendRedirect("index.jsp");
            return;
        }

        String nombre = resultSet.getString("Nombre");
        String apellidos = resultSet.getString("Apellidos");
        String fechaNacimiento = resultSet.getString("FechaNacimiento");
        String direccion = resultSet.getString("Direccion");

        connection.close();
%>

<form action="actualizar" method="post" class="max-w-md mx-auto bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
    <input type="hidden" name="carnet" value="<%= carnet %>">
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Nombre:</label>
        <input type="text" name="nombre" class="form-input w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600" value="<%= nombre %>">
    </div>
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Apellidos:</label>
        <input type="text" name="apellidos" class="form-input w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600" value="<%= apellidos %>">
    </div>
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Fecha Nacimiento:</label>
        <input type="date" name="fechaNacimiento" class="form-input w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600" value="<%= fechaNacimiento %>">
    </div>
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Dirección:</label>
        <textarea name="direccion" class="form-textarea w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600" rows="4"><%= direccion %></textarea>
    </div>
    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Actualizar</button>
</form>

<%
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        a.println("<h2>Error al cargar los datos del alumno.</h2>");
    }
%>

</body>
</html>
