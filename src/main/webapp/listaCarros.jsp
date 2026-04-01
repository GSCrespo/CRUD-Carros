<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container">

    <h2 class="text-center mb-4">Lista de Carros</h2>

    <table class="table table-dark table-striped table-hover">
        <thead>
        <tr>
            <th>#</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Ano</th>
            <th>Cor</th>
            <th>Combustível</th>
            <th>KM</th>
            <th>Transmissão</th>
            <th>Valor</th>
            <th>Avaliação</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="carro" items="${listaCarros}" varStatus="status">
            <tr>
                <td>${status.index}</td>
                <td>${carro.marca}</td>
                <td>${carro.modelo}</td>
                <td>${carro.ano}</td>
                <td>${carro.cor}</td>
                <td>${carro.combustivel}</td>
                <td>${carro.quilometragem}</td>
                <td>${carro.transmissao}</td>
                <td>R$ ${carro.valor}</td>
                <td>${carro.avaliacao}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>


<c:import url="/includes/footer.jsp" />
