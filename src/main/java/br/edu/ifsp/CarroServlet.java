package br.edu.ifsp;

import br.edu.ifsp.model.Carro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/carro")
public class CarroServlet extends HttpServlet {
    
    private static final List<Carro> listaCarros = new ArrayList<>();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");

        System.out.println("entrou no doGet");

        if(action == null){

            response.sendRedirect("listaCarros.jsp");
            return;
        }

        switch (action){

            case "editar":
                carregarParaEditar(request,response);
                System.out.println("entrou aqui");
                break;
            case "excluir":
                excluirCarro(request,response);
                break;
            default:
                response.sendRedirect("listaCarros.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String descricao = request.getParameter("descricao");
        String cor = request.getParameter("cor");
        String combustivel = request.getParameter("combustivel");
        double quilometragem = Double.parseDouble(request.getParameter("quilometragem"));
        String transmissao = request.getParameter("transmissao");
        double valor = Double.parseDouble(request.getParameter("valor"));
        double avaliacao = Double.parseDouble(request.getParameter("avaliacao"));

        List<String> listaValidacao = new ArrayList<>();

        // validações
        if(marca.isEmpty()){
            listaValidacao.add("Preencha a Marca");
        }
        if(modelo.isEmpty()){
            listaValidacao.add("Preencha o modelo");
        }
        if(ano < 0){
            listaValidacao.add("Ano não pode ser negativo");
        }
        if(descricao.isEmpty()){
            listaValidacao.add("Preencha a descrição");
        }
        if(cor.isEmpty()){
            listaValidacao.add("Preencha a cor");
        }
        if(combustivel.isEmpty()){
            listaValidacao.add("Preencha o tipo de combustível");
        }
        if(quilometragem < 0){
            listaValidacao.add("Quilometragem não pode ser nula");
        }
        if(transmissao.isEmpty()){
            listaValidacao.add("Preencha o tipo de transmissão (manual ou automática");
        }
        if(valor < 0){
            listaValidacao.add("Valor não pode ser negativo");
        }
        if(avaliacao < 0){
            listaValidacao.add("Avaliação não pode ser negativa");
        }

        //caso tenha erro, volta para o form
        if (!listaValidacao.isEmpty()) {
            request.setAttribute("erros", listaValidacao);
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        }else {

            Carro carro = new Carro(marca, modelo, ano, descricao, cor,
                    combustivel, quilometragem, transmissao, valor, avaliacao);

            listaCarros.add(carro);
            request.setAttribute("listaCarros", listaCarros);
            request.getRequestDispatcher("listaCarros.jsp").forward(request, response);
        }




    }

    private Carro buscarPorId(int id){
        for(Carro c : listaCarros){
            if(c.getId() == id){
                System.out.println(c.getId());
                return c;
            }
        }
        return null;
    }

    private void carregarParaEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int idParam = Integer.parseInt(request.getParameter("id"));

        Carro carro = buscarPorId(idParam);

        request.setAttribute("carro",carro);
        request.setAttribute("modo", "editar");
        request.getRequestDispatcher("cadastroCarro.jsp").forward(request,response);

    }

    private void excluirCarro(HttpServletRequest request, HttpServletResponse response) throws  IOException{
        int idParam = Integer.parseInt(request.getParameter("id"));

        Carro c = buscarPorId(idParam);

        if(c != null){
            listaCarros.remove(c);
        }
        response.sendRedirect("carro");
    }

}
