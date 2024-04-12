package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/detallesInscripcion")
public class DetallesInscripcion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codMateria = request.getParameter("codigo");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if (codMateria != null && !codMateria.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");

                // Consulta para obtener los detalles de los alumnos inscritos en la materia seleccionada
                String query = "SELECT a.carnet, a.nombre, a.apellidos " +
                        "FROM inscripciones i " +
                        "INNER JOIN alumnos a ON i.CarnetEstudiante = a.Carnet " +
                        "WHERE i.CodigoMateria = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, codMateria);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    out.println("<div style=\"margin: 0 auto; max-width: 800px;\">");
                    out.println("<h2 style=\"font-size: 1.5rem; font-weight: bold; margin-bottom: 1rem;\">Alumnos Inscritos</h2>");
                    out.println("<table style=\"width: 100%; border-collapse: collapse;\">");
                    out.println("<thead><tr><th style=\"border: 1px solid #ccc; padding: 8px;\">Carnet</th><th style=\"border: 1px solid #ccc; padding: 8px;\">Nombre</th><th style=\"border: 1px solid #ccc; padding: 8px;\">Apellidos</th></tr></thead>");
                    out.println("<tbody>");

                    int count = 0; // Contador de alumnos

                    do {
                        String carnet = resultSet.getString("carnet");
                        String nombre = resultSet.getString("nombre");
                        String apellidos = resultSet.getString("apellidos");

                        out.println("<tr><td style=\"border: 1px solid #ccc; padding: 8px;\">" + carnet + "</td><td style=\"border: 1px solid #ccc; padding: 8px;\">" + nombre + "</td><td style=\"border: 1px solid #ccc; padding: 8px;\">" + apellidos + "</td></tr>");
                        count++;
                    } while (resultSet.next());

                    out.println("</tbody></table>");

                    // Mostrar el conteo de alumnos
                    out.println("<p style=\"margin-top: 1rem;\">Total de Alumnos: " + count + "</p>");

                    // Enlace para regresar al panel de inicio
                    out.println("<p style=\"margin-top: 1rem;\"><a href=\"Panel_Inicio.jsp\" style=\"color: #007bff; text-decoration: none;\">Regresar al Panel de Inicio</a></p>");
                    out.println("</div>");
                } else {
                    out.println("<h2 style=\"font-size: 1.5rem; font-weight: bold; text-align: center; margin-top: 2rem;\">No se encontraron alumnos inscritos en esta materia.</h2>");
                }

                connection.close();
            } catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
                out.println("<h2 style=\"font-size: 1.5rem; font-weight: bold; text-align: center; margin-top: 2rem;\">Error al obtener los detalles de la inscripción.</h2>");
            }
        } else {
            out.println("<h2 style=\"font-size: 1.5rem; font-weight: bold; text-align: center; margin-top: 2rem;\">No se ha seleccionado ninguna materia.</h2>");
        }
    }

}