<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalles de Inscripción</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-4">
<div class="container mx-auto">
    <h1 class="text-3xl font-bold mb-4">Detalles de Inscripción</h1>

    <!-- Formulario para seleccionar la materia -->
    <form action="detallesInscripcion" method="post" class="mb-8">
        <div class="mb-4">
            <label class="block text-gray-800 font-bold mb-2">Selecciona una materia:</label>
            <select name="codigo" class="form-select w-full border border-gray-300 rounded-md px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-600">
                <%
                    PrintWriter a = response.getWriter();

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
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ver Detalles</button>
    </form>

    <!-- Aquí se mostrarán los detalles de la inscripción -->
    <div id="detalles" class="hidden">
        <h2 class="text-xl font-bold mb-4">Detalles de la Inscripción</h2>
        <table class="table-auto w-full">
            <thead>
            <tr>
                <th class="px-4 py-2">Carnet</th>
                <th class="px-4 py-2">Nombre</th>
                <th class="px-4 py-2">Apellidos</th>
            </tr>
            </thead>
            <tbody id="detallesBody">
            <%-- Aquí se insertarán los detalles de la inscripción desde el servlet --%>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
