<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmar Eliminación</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-4">
<h1>Confirmar Eliminación</h1>

<%
    String codigo = request.getParameter("codigo");
    PrintWriter a = response.getWriter();

    if (codigo == null || codigo.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
        Statement statement = connection.createStatement();

        String query = "SELECT * FROM materias WHERE CodigoMateria = '" + codigo + "'";
        ResultSet resultSet = statement.executeQuery(query);

        if (!resultSet.next()) {
            response.sendRedirect("index.jsp");
            return;
        }

        String nombre = resultSet.getString("Nombre");
        String fechaCreacion = resultSet.getString("FechaCreacion");
        String descripcion = resultSet.getString("Descripcion");

        connection.close();
%>

<p>¿Estás seguro de que deseas eliminar la materia con los siguientes datos?</p>

<ul>
    <li><strong>Carnet:</strong> <%= codigo %></li>
    <li><strong>Nombre de la materia:</strong> <%= nombre %> </li>
    <li><strong>Fecha de Creacion:</strong> <%= fechaCreacion %></li>
    <li><strong>Descripción:</strong> <%= descripcion %></li>
</ul>

<form action="eliminar-mat" method="post">
    <input type="hidden" name="codigo" value="<%= codigo %>">
    <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded mr-2">Eliminar</button>
    <a href="Panel_Inicio.jsp" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Cancelar</a>
</form>

<%
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        a.println("<h2>Error al obtener los datos del alumno.</h2>");
    }
%>

</body>
</html>
