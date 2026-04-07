<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<div class="container">

        <div class="card bg-secondary">
            <div class="card-header text-center">
                <c:choose>
                    <c:when test="${not empty carro.id}">
                        <h1>Editando Carro</h1>
                    </c:when>
                    <c:otherwise>
                        <h1>Cadastrar Carro</h1>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="card-body">
                <form action="carro" method="post">

                    <input type="hidden" name="id" value="${carro.id}">

                    <div class="mb-3">
                        <label class="form-label">Marca</label>
                        <input type="text" id="marca" name="marca" value="${carro.marca}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Modelo</label>
                        <input type="text" id="modelo" name="modelo"  value="${carro.modelo}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Ano</label>
                        <input type="number" id="ano" name="ano" min="0" value="${carro.ano}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Descrição</label>
                        <textarea name="descricao" id="descricao" class="form-control" required>${carro.descricao}</textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Cor</label>
                        <input type="text" id="cor" name="cor" value="${carro.cor}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Combustível</label>
                        <select name="combustivel" id="combustivel" class="form-select">
                           <option ${carro.combustivel == 'Gasolina' ? 'selected' : ''}>Gasolina</option>
                           <option ${carro.combustivel == 'Álcool' ? 'selected' : ''}>Álcool</option>
                           <option ${carro.combustivel == 'Diesel' ? 'selected' : ''}>Diesel</option>
                           <option ${carro.combustivel == 'Elétrico' ? 'selected' : ''}>Elétrico</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quilometragem</label>
                        <input type="number" name="quilometragem" id="quilometragem" min="0" value="${carro.quilometragem}" class="form-control" >
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Transmissão</label>
                        <select name="transmissao" id="transmissao" class="form-select">
                            <option ${carro.transmissao == 'Manual' ? 'selected' : ''}>Manual</option>
                            <option ${carro.transmissao == 'Automática' ? 'selected' : ''}>Automática</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Valor (R$)</label>
                        <input type="number" step="0.01" name="valor" id="valor" min="" value="${carro.valor}" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Avaliação</label>
                        <input type="number" min="0" max="5" name="avaliacao" id="avaliacao" value="${carro.avaliacao}" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-success w-100">
                        Cadastrar
                    </button>

                </form>
            </div>
        </div>
    </div>



<c:import url="/includes/footer.jsp" />
