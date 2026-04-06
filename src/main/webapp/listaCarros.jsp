<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container">

    <c:choose>
        <c:when test="${empty listaCarros}">
            <div class="alert alert-warning">
                Nenhum carro cadastrado.
            </div>
        </c:when>

        <c:otherwise>
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
                         <th>Editar</th>
                         <th>Excluir</th>
                     </tr>
                     </thead>

                     <tbody>
                     <c:forEach var="carro" items="${listaCarros}">
                         <tr>
                             <td>${carro.id}</td>
                             <td>${carro.marca}</td>
                             <td>${carro.modelo}</td>
                             <td>${carro.ano}</td>
                             <td>${carro.cor}</td>
                             <td>${carro.combustivel}</td>
                             <td>${carro.quilometragem}</td>
                             <td>${carro.transmissao}</td>
                             <td>R$ ${carro.valor}</td>
                             <td>${carro.avaliacao}</td>
                             <td><a class="btn btn-warning"href="carro?action=editar&id=${carro.getId()}">Editar</a></td>
                             <td><a class="btn btn-danger"href="carro?action=excluir&id=${carro.getId()}">Excluir</a></td>
                         </tr>
                     </c:forEach>
                     </tbody>
                 </table>
        </c:otherwise>
    </c:choose>


</div>


<c:import url="/includes/footer.jsp" />
