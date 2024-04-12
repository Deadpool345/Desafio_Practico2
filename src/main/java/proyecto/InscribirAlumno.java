package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inscribir")
public class InscribirAlumno extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String carnet = request.getParameter("carnet");
        String codMateria = request.getParameter("codigo");

        if (carnet == null || carnet.isEmpty() || codMateria == null || codMateria.isEmpty()) {
            out.println("<h2>Debe seleccionar un alumno y una materia.</h2>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
            Statement  s = connection.createStatement();

            // Check for duplicate enrollment
            String sql = "SELECT * FROM inscripciones WHERE CarnetEstudiante = '" + carnet + "' AND CodigoMateria = '" + codMateria + "'";
            ResultSet resultSet = s.executeQuery(sql);

            if (resultSet.next()) {
                out.println("<h2>El alumno ya está inscrito en esta materia.</h2>");
                connection.close();
                return;
            }

            //obtener fecha actual
            java.sql.Date fechaActual = new java.sql.Date(System.currentTimeMillis());


            // Insert enrollment record
            String insertQuery = "INSERT INTO inscripciones (CarnetEstudiante, CodigoMateria, FechaInscripcion) VALUES ('" + carnet + "', '" + codMateria + "', '" + fechaActual + "')";
            s.executeUpdate(insertQuery);


            connection.close();
            out.println("<div style='text-align: center; margin-top: 20px;'>");
            out.println("<h2 style='color: green;'>Alumno inscrito exitosamente</h2>");
            out.println("<form action='Panel_Inicio.jsp' method='get'>");
            out.println("<button style='background-color: #4CAF50; color: white; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 5px;' type='submit'>Regresar al Panel del Administrador</button>");
            out.println("</form>");
            out.println("</div>");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            out.println("<h2>Error al inscribir al alumno.</h2>");
        }
    }
}