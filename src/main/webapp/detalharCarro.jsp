<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container">
    <h2>${carro.marca} ${carro.modelo}</h2>

    <p>Ano: ${carro.ano}</p>
    <p>Cor: ${carro.cor}</p>
    <p>Combustível: ${carro.combustivel}</p>
    <p>Valor: R$ ${carro.valor}</p>
    <p>${carro.descricao}</p>
</div>


<c:import url="/includes/footer.jsp" />