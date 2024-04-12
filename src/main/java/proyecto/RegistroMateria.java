package proyecto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/materia")
public class RegistroMateria extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String fecha = request.getParameter("fecha");
        String descripcion = request.getParameter("descripcion");

        // Insertar los datos en la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/desafio", "root", "");
            Statement s = conn.createStatement();

            String sql = "INSERT INTO materias (CodigoMateria, Nombre, Descripcion, FechaCreacion) VALUES ('" + codigo + "', '" + nombre + "', '" + descripcion + "','" + fecha + "')";


            // Ejecutar la consulta SQL
            int rowsAffected = s.executeUpdate(sql);
            if (rowsAffected > 0) {
                out.println("<p class=\"text-green-500 text-center\">Registro de la materia exitoso!</p>");
            } else {
                out.println("<h2>Error al registrar la materia</h2>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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
