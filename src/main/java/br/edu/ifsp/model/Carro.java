package br.edu.ifsp.model;

public class Carro {

    private String marca;
    private String modelo;
    private int ano;
    private String descricao;
    private String cor;
    private String combustivel;
    private double quilometragem;
    private String transmissao;
    private double valor;
    private double avaliacao;

    //construtor vazio

    public Carro() {

    }

    //construtor completo
    public Carro(String marca, String modelo, int ano, String descricao, String cor,
                 String combustivel, double quilometragem, String transmissao,
                 double valor, double avaliacao) {

        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.descricao = descricao;
        this.cor = cor;
        this.combustivel = combustivel;
        this.quilometragem = quilometragem;
        this.transmissao = transmissao;
        this.valor = valor;
        this.avaliacao = avaliacao;
    }

    //getters

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public int getAno() {
        return ano;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getCor() {
        return cor;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public double getQuilometragem() {
        return quilometragem;
    }

    public String getTransmissao() {
        return transmissao;
    }

    public double getValor() {
        return valor;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    //setters

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }

    public void setQuilometragem(double quilometragem) {
        this.quilometragem = quilometragem;
    }

    public void setTransmissao(String transmissao) {
        this.transmissao = transmissao;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }
}

