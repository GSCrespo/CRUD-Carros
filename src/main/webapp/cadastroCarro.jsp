<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<div class="container flex-grow-1 mt-4">

    <div class="card shadow-lg">
        <div class="card-header text-center bg-dark text-white">

            <c:choose>
                <c:when test="${not empty carro.id}">
                    <h3>Editando Carro</h3>
                </c:when>
                <c:otherwise>
                    <h3>Cadastrar Carro</h3>
                </c:otherwise>
            </c:choose>

        </div>

        <div class="card-body">

            <form action="${pageContext.request.contextPath}/carro" method="post">

                <input type="hidden" name="id" value="${carro.id}">

                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Marca</label>
                        <input type="text" name="marca" value="${carro.marca}" class="form-control" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Modelo</label>
                        <input type="text" name="modelo" value="${carro.modelo}" class="form-control" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label class="form-label">Ano</label>
                        <input type="number" name="ano" value="${carro.ano}" class="form-control" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label class="form-label">Cor</label>
                        <input type="text" name="cor" value="${carro.cor}" class="form-control" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label class="form-label">Quilometragem</label>
                        <input type="number" name="quilometragem" value="${carro.quilometragem}" class="form-control">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Combustível</label>
                        <select name="combustivel" class="form-select">
                            <option ${carro.combustivel == 'Gasolina' ? 'selected' : ''}>Gasolina</option>
                            <option ${carro.combustivel == 'Álcool' ? 'selected' : ''}>Álcool</option>
                            <option ${carro.combustivel == 'Diesel' ? 'selected' : ''}>Diesel</option>
                            <option ${carro.combustivel == 'Elétrico' ? 'selected' : ''}>Elétrico</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Transmissão</label>
                        <select name="transmissao" class="form-select">
                            <option ${carro.transmissao == 'Manual' ? 'selected' : ''}>Manual</option>
                            <option ${carro.transmissao == 'Automática' ? 'selected' : ''}>Automática</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Valor (R$)</label>
                        <input type="number" step="0.01" name="valor" value="${carro.valor}" class="form-control" required>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label">Descrição</label>
                        <textarea name="descricao" class="form-control" rows="3">${carro.descricao}</textarea>
                    </div>

                </div>

                <button type="submit" class="btn btn-success w-100 mt-3">
                    Salvar
                </button>

            </form>

        </div>
    </div>

</div>



<c:import url="/includes/footer.jsp" />
