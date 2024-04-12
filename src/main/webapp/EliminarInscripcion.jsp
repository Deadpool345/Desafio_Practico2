<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inscribir Alumno</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-4">
<h1 class="text-4xl text-center mb-[2rem]">Eliminar Alumnos de la materia</h1>

<form action="EliminarInscripcion" method="post">
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Alumno:</label>
        <select name="carnet" class="form-select w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600">
            <%
                PrintWriter a = response.getWriter();

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
                    Statement statement = connection.createStatement();

                    String query = "SELECT carnet, nombre, apellidos FROM alumnos";
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        String carnetAlumno = resultSet.getString("carnet");
                        String nombreAlumno = resultSet.getString("nombre");
                        String apellidosAlumno = resultSet.getString("apellidos");
            %>
            <option value="<%= carnetAlumno %>"><%= nombreAlumno %> <%= apellidosAlumno %></option>
            <%
                    }

                    connection.close();
                } catch (ClassNotFoundException | SQLException ex) {
                    ex.printStackTrace();
                    a.println("<h2>Error al obtener la lista de alumnos.</h2>");
                }
            %>
        </select>
    </div>
    <div class="mb-4">
        <label class="block text-gray-800 font-bold mb-2">Materia:</label>
        <select name="codigo" class="form-select w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
                    Statement statement = connection.createStatement();

                    String query = "SELECT CodigoMateria, Nombre FROM materias";
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        String codMateria = resultSet.getString("CodigoMateria");
                        String nombreMateria = resultSet.getString("Nombre");
            %>
            <option value="<%= codMateria %>"><%= nombreMateria %></option>
            <%
                    }

                    connection.close();
                } catch (ClassNotFoundException | SQLException ex) {
                    ex.printStackTrace();
                    a.println("<h2>Error al obtener la lista de materias.</h2>");
                }
            %>
        </select>
    </div>
    <button type="submit" class="bg-red-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Eliminar Inscripción</button>
</form>
</body>
</html>

