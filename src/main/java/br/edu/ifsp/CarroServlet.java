package br.edu.ifsp;

import br.edu.ifsp.model.Carro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet
public class CarroServlet {
    
    private static List<Carro> listaCarros = new ArrayList<>();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{


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


    }
}
