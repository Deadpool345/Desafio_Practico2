package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/EliminarInscripcion")
public class EliminarInscripcion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String carnet = request.getParameter("carnet");
        String codMateria = request.getParameter("codigo");

        if (carnet == null || carnet.isEmpty() || codMateria == null || codMateria.isEmpty()) {
            out.println("<h2>Debe seleccionar un alumno y una materia para eliminar la inscripción.</h2>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");

            String deleteQuery = "DELETE FROM inscripciones WHERE CarnetEstudiante = ? AND CodigoMateria = ?";
            PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery);
            deleteStatement.setString(1, carnet);
            deleteStatement.setString(2, codMateria);

            int affectedRows = deleteStatement.executeUpdate();

            if (affectedRows > 0) {
                out.println("<div style='text-align: center; margin-top: 20px;'>");
                out.println("<h2 style='color: green;'>Inscripción eliminada exitosamente.</h2>");
                out.println("<form action='Panel_Inicio.jsp' method='get'>");
                out.println("<button style='background-color: #4CAF50; color: white; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 5px;' type='submit'>Regresar al Panel del Administrador</button>");
                out.println("</form>");
                out.println("</div>");
            } else {
                out.println("<h2>No se encontró la inscripción especificada.</h2>");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            out.println("<h2>Error al eliminar la inscripción.</h2>");
        }
    }
}