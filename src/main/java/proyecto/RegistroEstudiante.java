package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/estudiante")
public class RegistroEstudiante extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener los parámetros del formulario
        String carnet = request.getParameter("carnet");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fecha = request.getParameter("fecha");
        String direccion = request.getParameter("direccion");

        // Insertar los datos en la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Establecer la conexión con la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
            Statement s = conn.createStatement();

            String sql = "INSERT INTO alumnos (Carnet, Nombre, Apellidos, FechaNacimiento, Direccion) VALUES ('" + carnet + "', '" + nombre + "', '" + apellido + "','" + fecha + "', '" + direccion + "')";

            int rowsAffected = s.executeUpdate(sql);;
            if (rowsAffected > 0) {

                out.println("<p class=\"text-green-500 text-center\">Registro del estudiante exitoso!</p>");
            } else {
                // Imprimir mensaje de error
                out.println("<h2>Error al registrar estudiante</h2>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Imprimir mensaje de error
            out.println("<h2>Error al conectar con la base de datos</h2>");
        } finally {
            // Cerrar la conexión y los recursos
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
