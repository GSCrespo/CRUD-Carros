package br.edu.ifsp;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Sair")
public class SairServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // ACABA A SESSÃO
        }

        response.sendRedirect("index.jsp"); // volta pra home
    }
}