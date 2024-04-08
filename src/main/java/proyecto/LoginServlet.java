package proyecto;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet({"/login", "/logout"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.endsWith("/login")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && username.equals("Admin") && password.equals("12345")) {

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("Panel_Inicio.jsp");
            } else {
                // Credenciales inválidas o username es null, mostrar un mensaje de error
                response.sendRedirect("index.jsp?error=true");

            }
        } else if (uri.endsWith("/logout")) {

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("index.jsp");
        }
    }
}
