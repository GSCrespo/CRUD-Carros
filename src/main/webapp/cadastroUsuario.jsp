<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
<div class="container">
<form action="${pageContext.request.contextPath}/usuario" method="post">
    <div class="form-row align-items-center">
        <div class="col-sm-3 my-1">
            <label class="sr-only">Nome de Usuário</label>
            <input type="text" class="form-control" name="username" id="username" value="${usuario.username}" placeholder="Seu Username">
        </div>
        <div class="col-sm-3 my-1">
            <label class="sr-only">Senha</label>
            <div class="input-group">
                <input type="password" class="form-control" name="senha" id="senha" value="${usuario.senha}" placeholder="Sua Senha">
            </div>
        </div>
        <div class="col-sm-3 my-1">
            <label>Tipo</label>
            <select name="tipo" class="form-control">
                <option value="">Selecione</option>
                <c:if test="${usuarioLogado != null && usuarioLogado.tipo == 'ADMIN'}">
                <option value="ADMIN">ADMIN</option> //somente ADMIN pode cadastrar outro ADMIN
                </c:if>
                <option value="COMUM">COMUM</option>
            </select>
        </div>
        <div class="col-auto my-1">
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </div>
    </div>
</form>
</div>
<c:import url="/includes/footer.jsp" />