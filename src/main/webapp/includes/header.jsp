<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-dark bg-dark">
              <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#sobre">Sobre</a>
                    </li>
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${usuarioLogado == null}">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="Sair">Sair (${usuarioLogado.userName})</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    </ul>
                    <div class="d-flex gap-2">

                        <!-- Apenas ADMIN pode ver -->
                        <c:if test="${usuarioLogado != null && usuarioLogado.tipo == 'ADMIN'}">
                            <a class="btn btn-success" href="${pageContext.request.contextPath}/cadastroCarro.jsp">
                                Cadastrar Carro
                            </a>
                        </c:if>

                        <!-- Qualquer um pode ver -->
                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/carro">
                            Listar Carros
                        </a>

                    </div>
                </div>
              </div>
            </nav>
        </div>