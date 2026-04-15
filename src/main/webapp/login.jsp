<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<c:import url="/includes/header.jsp" />
<div class="container flex-grow-1">

<h2>Login</h2>

<form action="login" method="post">
    <label>Usuário:</label><br>
    <input type="text" name="username"><br><br>

    <label>Senha:</label><br>
    <input type="password" name="senha"><br><br>

    <button type="submit" class="btn btn-success">Entrar</button>
    <a href="cadastroUsuario.jsp" class="btn btn-primary" >Cadastre-se</a>
</form>
    <c:if test="${not empty erro}">
        <p style="color:red;">${erro}</p>
    </c:if>
</div>

<c:import url="/includes/footer.jsp" />
