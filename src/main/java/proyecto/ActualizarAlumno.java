package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/actualizar")
public class ActualizarAlumno extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        String carnet = request.getParameter("carnet");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String direccion = request.getParameter("direccion");

        if (carnet == null || carnet.isEmpty() || nombre == null || nombre.isEmpty() || apellidos == null || apellidos.isEmpty() || fechaNacimiento == null || fechaNacimiento.isEmpty() || direccion == null || direccion.isEmpty()) {
            response.sendRedirect("editar_alumno.jsp?carnet=" + carnet);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
            Statement statement = connection.createStatement();

            String query = "UPDATE alumnos SET Nombre = '" + nombre + "', Apellidos = '" + apellidos + "', FechaNacimiento = '" + fechaNacimiento + "', Direccion = '" + direccion + "' WHERE Carnet = '" + carnet + "'";
            statement.executeUpdate(query);

            connection.close();


            out.println("<div style='text-align: center; margin-top: 20px;'>");
            out.println("<h2 style='color: green;'>Los datos del alumno han sido actualizados correctamente</h2>");
            out.println("<form action='Panel_Inicio.jsp' method='get'>");
            out.println("<button style='background-color: #4CAF50; color: white; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 5px;' type='submit'>Regresar al Panel del Administrador</button>");
            out.println("</form>");
            out.println("</div>");

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            out.println("<h2>Error al actualizar los datos del alumno.</h2>");
        }
    }
}
