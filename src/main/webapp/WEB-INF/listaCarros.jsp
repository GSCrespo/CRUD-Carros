<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


<div class="container flex-grow-1 mt-4">

    <h2 class="text-center mb-4">Lista de Carros</h2>

    <div class="row">

        <c:forEach var="carro" items="${listaCarros}">
            <div class="col-md-4 col-sm-6 mb-4">

                <div class="card h-100 shadow-sm">

                    <img src="${pageContext.request.contextPath}/uploads/${carro.imagem}"
                         class="card-img-top" style="height: 180px; object-fit: cover;">

                    <div class="card-body">
                        <h5>${carro.marca} ${carro.modelo}</h5>

                        <p>
                            <strong>Ano:</strong> ${carro.ano} <br>
                            <strong>Cor:</strong> ${carro.cor} <br>
                            <strong>Valor:</strong> <fmt:formatNumber value="${carro.valor}" type="currency"/>
                        </p>
                    </div>

                    <div class="card-footer d-flex justify-content-between">

                        <a href="carro?action=detalhes&id=${carro.id}"
                           class="btn btn-primary btn-sm">
                            Ver
                        </a>

                        <c:if test="${usuarioLogado != null && usuarioLogado.tipo == 'ADMIN'}">
                            <a href="carro?action=editar&id=${carro.id}"
                               class="btn btn-warning btn-sm">
                                Editar
                            </a>
                        </c:if>

                        <c:if test="${usuarioLogado != null && usuarioLogado.tipo == 'ADMIN'}">
                            <a href="carro?action=excluir&id=${carro.id}"
                            class="btn btn-danger btn-sm">
                                Excluir
                            </a>
                        </c:if>


                    </div>

                </div>

            </div>
        </c:forEach>

    </div>
</div>

<c:import url="/includes/footer.jsp" />