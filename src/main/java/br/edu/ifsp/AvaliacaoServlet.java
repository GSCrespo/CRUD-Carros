package br.edu.ifsp;

import br.edu.ifsp.model.Carro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/avaliacao")
public class AvaliacaoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        double nota = Double.parseDouble(request.getParameter("avaliacao"));

        Carro carro = CarroServlet.buscarPorIdStatic(id);

        if (carro != null) {
            if (nota >= 0 && nota <= 5) {

                carro.setSomaAvaliacao(carro.getSomaAvaliacao() + nota);
                carro.setTotalAvaliacao(carro.getTotalAvaliacao() + 1);

            }
        }

        response.sendRedirect(request.getContextPath() + "/carro");
    }
}