package br.edu.ifsp;

import br.edu.ifsp.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UsuarioServlet", value = "/usuario")
public class UsuarioServlet extends HttpServlet {

    public static final List<Usuario> listaUsuarios = new ArrayList<>();

    // ADMIN INICIAL
    static{
        listaUsuarios.add(new Usuario("admin", "admin", "ADMIN"));
    }

    //  LISTAR USUÁRIOS
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario logado = (Usuario) session.getAttribute("usuarioLogado");

        if (logado == null || !"ADMIN".equals(logado.getTipo())) {
            response.sendRedirect("index.jsp"); // volta pra home, não pro login
            return;
        }


        request.setAttribute("usuarios", listaUsuarios);
        request.getRequestDispatcher("listaUsuarios.jsp").forward(request, response);
    }

    //  CADASTRAR USUÁRIO
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario logado = (Usuario) session.getAttribute("usuarioLogado");

        if (logado == null || !"ADMIN".equals(logado.getTipo())) {
            response.sendRedirect("index.jsp"); // volta pra home, não pro login
            return;
        }

        String userName = request.getParameter("username");
        String senha = request.getParameter("senha");
        String tipo = request.getParameter("tipo"); // ADMIN ou USER

        List<String> erros = new ArrayList<>();

        //  VALIDAÇÕES
        if (userName == null || userName.isEmpty()) {
            erros.add("Preencha o username");
        }

        if (senha == null || senha.length() < 5) {
            erros.add("Senha deve conter no mínimo 5 caracteres");
        }

        if (tipo == null || tipo.isEmpty()) {
            erros.add("Selecione o tipo de usuário");
        }

        //  Verificar se usuário já existe
        for (Usuario u : listaUsuarios) {
            if (u.getUserName().equals(userName)) {
                erros.add("Usuário já existe");
                break;
            }
        }

        //  Se tiver erro
        if (!erros.isEmpty()) {
            request.setAttribute("erros", erros);
            request.getRequestDispatcher("cadastroUsuario.jsp").forward(request, response);
            return;
        }

        //  Criar usuário
        Usuario novoUsuario = new Usuario(userName, senha, tipo);
        listaUsuarios.add(novoUsuario);

        response.sendRedirect("usuario");
    }
}