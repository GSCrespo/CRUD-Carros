package br.edu.ifsp;

import br.edu.ifsp.exception.AcessoNegadoException;
import br.edu.ifsp.model.Carro;
import br.edu.ifsp.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/carro")
@MultipartConfig
public class CarroServlet extends HttpServlet {
    
    private static final List<Carro> listaCarros = new ArrayList<>();
    // carros fixos para teste
    static {
        listaCarros.add(new Carro(
                "Volkswagen", "Fusca", 1980,
                "Clássico raiz, econômico e cheio de história",
                "Azul", "Gasolina", 120000,
                "Manual", 11000, "fusca.jpg"
        ));

        listaCarros.add(new Carro(
                "Volkswagen", "Kombi", 1995,
                "Perfeita pra viagem, food truck ou role com a galera",
                "Branca", "Gasolina", 200000,
                "Manual", 19000, "kombi.jpg"
        ));

        listaCarros.add(new Carro(
                "Chevrolet", "Celta", 2012,
                "Barato, confiável e econômico pra cidade",
                "Prata", "Flex", 90000,
                "Manual", 25000, "celta.jpg"
        ));
    }
    List<Carro> listaLancamento = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");


        if(action == null){
            action = "home";
        }
        switch (action){

            case "editar":

                if (!isAdmin(request)) {
                    throw new AcessoNegadoException("Acesso negado! Você não tem permissão para acessar isso :/");
                }

                carregarParaEditar(request,response);
                break;

            case "excluir":

                if (!isAdmin(request)) {
                    throw new AcessoNegadoException("Acesso negado! Você não tem permissão para acessar isso :/");
                }

                excluirCarro(request,response);
                break;

            case "listar":
                if (!isAdmin(request)) {
                    throw new AcessoNegadoException("Acesso negado! Você não tem permissão para acessar isso :/");
                }
                request.setAttribute("listaCarros", listaCarros);
                request.getRequestDispatcher("/WEB-INF/listaCarros.jsp").forward(request, response);
                break;

            case "home":
                if(!listaCarros.isEmpty()) {
                    listaLancamento = listaCarros.stream()
                            .sorted(Comparator.comparing(Carro::getValor).reversed())
                            .limit(5)
                            .collect(Collectors.toList());
                    System.out.println(listaLancamento.size());
                }
                request.setAttribute("listaCarros", listaCarros);
                request.setAttribute("lancamentos",listaLancamento);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case "detalhes":

                int id = Integer.parseInt(request.getParameter("id"));
                Carro carro = listaCarros.stream().filter(
                        c -> c.getId() == id
                ).findFirst().orElse(null);
                request.setAttribute("carro",carro);
                request.getRequestDispatcher("detalharCarro.jsp").forward(request,response);
                break;

            case "novo":

                if (!isAdmin(request)) {
                    throw new AcessoNegadoException("Acesso negado!");
                }

                request.getRequestDispatcher("/WEB-INF/cadastroCarro.jsp")
                        .forward(request, response);
                break;

            case "buscar":
                String termo = request.getParameter("termoBusca");
                if(termo == null || termo.trim().isEmpty()){
                    response.sendRedirect("carro?action=home");
                    return;
                }
                List<Carro> Resultados = listaCarros.stream()
                        .filter(c ->
                            c.getMarca().toLowerCase().contains(termo.toLowerCase())  ||
                            c.getModelo().toLowerCase().contains(termo.toLowerCase())
                        ).collect(Collectors.toList());
                request.setAttribute("resultados",Resultados);
                request.setAttribute("termoBusca",termo);
                request.getRequestDispatcher("/resultadosCarros.jsp").forward(request,response);
                break;

            default:
                request.setAttribute("listaCarros", listaCarros);
                request.getRequestDispatcher("listaCarros.jsp").forward(request, response);
                break;
                // verificar fluxo do default dps, ajustar
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        HttpSession session = request.getSession();
        Usuario logado = (Usuario) session.getAttribute("usuarioLogado");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (!isAdmin(request)) {
            throw new AcessoNegadoException("Acesso negado! Você não tem permissão para acessar isso :/");
        }

        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String descricao = request.getParameter("descricao");
        String cor = request.getParameter("cor");
        String combustivel = request.getParameter("combustivel");
        double quilometragem = Double.parseDouble(request.getParameter("quilometragem"));
        String transmissao = request.getParameter("transmissao");
        double valor = Double.parseDouble(request.getParameter("valor"));

        Part imagem = request.getPart("imagem");
        String nomeArquivo = imagem.getSubmittedFileName();
        String nomeFinal = System.currentTimeMillis() + "_"+nomeArquivo;
        String caminho = getServletContext().getRealPath("/uploads");
        File pasta = new File(caminho);
        if(!pasta.exists()){
            pasta.mkdir();
        }
        imagem.write(caminho + File.separator + nomeFinal);

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
            listaValidacao.add("Quilometragem não pode ser negativa");
        }
        if(transmissao.isEmpty()){
            listaValidacao.add("Preencha o tipo de transmissão (manual ou automática)");
        }
        if(valor < 0){
            listaValidacao.add("Valor não pode ser negativo");
        }

        //caso tenha erro, volta para o form
        if (!listaValidacao.isEmpty()) {
            request.setAttribute("erros", listaValidacao);
            request.getRequestDispatcher("cadastroCarro.jsp").forward(request, response);
        }else {
            String idParam = request.getParameter("id");
            if(idParam != null && !idParam.isEmpty()){
                int id = Integer.parseInt(idParam);

                Carro carroExistente = buscarPorId(id);

                if(carroExistente == null){
                    response.sendRedirect("carro");
                    return;
                }

                carroExistente.setMarca(marca);
                carroExistente.setModelo(modelo);
                carroExistente.setAno(ano);
                carroExistente.setDescricao(descricao);
                carroExistente.setCor(cor);
                carroExistente.setCombustivel(combustivel);
                carroExistente.setQuilometragem(quilometragem);
                carroExistente.setTransmissao(transmissao);
                carroExistente.setValor(valor);

            }else {
                Carro carro = new Carro(marca, modelo, ano, descricao, cor,
                        combustivel, quilometragem, transmissao, valor, nomeFinal );

                listaCarros.add(carro);
                //request.setAttribute("listaCarros", listaCarros);
                //request.getRequestDispatcher("listaCarros.jsp").forward(request, response);
            }
            response.sendRedirect("carro");
        }




    }

    private Carro buscarPorId(int id){
        for(Carro c : listaCarros){
            if(c.getId() == id){
                System.out.println("---- id do carro buscado");
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
        request.getRequestDispatcher("/WEB-INF/cadastroCarro.jsp").forward(request,response);

    }

    private void excluirCarro(HttpServletRequest request, HttpServletResponse response) throws  IOException{
        int idParam = Integer.parseInt(request.getParameter("id"));


        Carro c = buscarPorId(idParam);
        System.out.println("excluir carro");
        System.out.println(c);
        if(c != null){
            listaCarros.remove(c);
        }

        for(Carro carro : listaCarros){
            System.out.println(carro.getId());
        }

        response.sendRedirect("carro");
    }

    private boolean isAdmin(HttpServletRequest request) {
            HttpSession session = request.getSession();
            Usuario logado = (Usuario) session.getAttribute("usuarioLogado");
            return (logado != null && "ADMIN".equals(logado.getTipo()));
    }

    public static Carro buscarPorIdStatic(int id){
        for(Carro c : listaCarros){
            if(c.getId() == id){
                return c;
            }
        }
        return null;
    }

}
