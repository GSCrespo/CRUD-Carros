<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
<div class="container">
<form>
    <div class="form-row align-items-center">
        <div class="col-sm-3 my-1">
            <label class="sr-only" for="inlineFormInputName">Nome de Usuário</label>
            <input type="text" class="form-control" id="inlineFormInputName" value="${usuario.username}" placeholder="Seu Username">
        </div>
        <div class="col-sm-3 my-1">
            <label class="sr-only" for="inlineFormInputGroupUsername">Senha</label>
            <div class="input-group">
                <input type="text" class="form-control" id="inlineFormInputGroupUsername" value="${usuario.senha}" placeholder="Sua Senha">
            </div>
        </div>
        <div class="col-auto my-1">
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </div>
    </div>
</form>
</div>
<c:import url="/includes/footer.jsp" />