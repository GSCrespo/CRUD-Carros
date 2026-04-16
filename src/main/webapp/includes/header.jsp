<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <div class="container flex-grow-1">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">


                    <a class="navbar-brand" href="${pageContext.request.contextPath}/carro?action=home">
                        CRUD Carros
                    </a>

                    <!-- button pro mobile -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>


                    <div class="collapse navbar-collapse" id="navbarNav">

                        <!-- Menu esquerdo -->
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/carro?action=home">Home</a>
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
                                        <a class="nav-link" href="${pageContext.request.contextPath}/Sair">
                                            Sair ${usuarioLogado.tipo} (${usuarioLogado.userName})
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>


                        <div class="d-flex gap-2 me-3">
                            <c:if test="${usuarioLogado != null && usuarioLogado.tipo == 'ADMIN'}">
                                <a class="btn btn-success" href="${pageContext.request.contextPath}/cadastroCarro.jsp">
                                    Cadastrar Carro
                                </a>

                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/cadastroUsuario.jsp">
                                    Cadastrar Usuário
                                </a>

                                <a class="btn btn-warning" href="${pageContext.request.contextPath}/carro">
                                    Listar Carros
                                </a>
                            </c:if>
                        </div>


                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Buscar carro..." name="termoBusca">
                            <button class="btn btn-outline-light" type="submit">Buscar</button>
                        </form>

                    </div>
                </div>
            </nav>
        </div>