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
<h1 class="text-2xl font-bold mb-4">Lista de Alumnos</h1>

<table class="table-auto border-collapse w-full mb-4 bg-white p-4">
    <thead>
    <tr class=" bg-white ">
        <th class="px-4 py-2">Carnet</th>
        <th class="px-4 py-2">Nombre</th>
        <th class="px-4 py-2">Apellido</th>
        <th class="px-4 py-2">Fecha Nacimiento</th>
        <th class="px-4 py-2">Dirección</th>
        <th class="px-4 py-2">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        PrintWriter a = response.getWriter();
        try {


            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
            Statement s = conexion.createStatement();

            String query = "SELECT * FROM alumnos";
            ResultSet rs = s.executeQuery(query);

            while (rs.next()) {
    %>
    <tr>
        <td class="border px-4 py-2"><%= rs.getString("Carnet") %></td>
        <td class="border px-4 py-2"><%= rs.getString("Nombre") %></td>
        <td class="border px-4 py-2"><%= rs.getString("Apellidos") %></td>
        <td class="border px-4 py-2"><%= rs.getString("FechaNacimiento") %></td>
        <td class="border px-4 py-2"><%= rs.getString("Direccion") %></td>
        <td class="border px-4 py-2 flex justify-center">
            <a href="editar_alumno.jsp?carnet=<%= rs.getString("Carnet") %>" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mr-2">Editar</a>
            <a href="eliminar_alumno.jsp?carnet=<%= rs.getString("Carnet") %>" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Eliminar</a>
        </td>
    </tr>
    <%
            }
            conexion.close();
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            a.println("<h2>Error al cargar los datos de los alumnos.</h2>");
        }
    %>
    </tbody>
</table>
</body>
</html>
