<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<div class="container mt-4">

    <h2 class="mb-3">Lançamentos</h2>

    <div id="carouselCarros" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">

            <c:forEach var="carro" items="${lancamentos}" varStatus="status">
                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">

                    <div class="d-flex justify-content-center">
                        <div class="card" style="width: 30rem;">
                            <div class="card-body">
                                <h5 class="card-title">
                                    ${carro.marca} ${carro.modelo}
                                </h5>
                                <p class="card-text">
                                    Ano: ${carro.ano} <br>
                                    Cor: ${carro.cor} <br>
                                    Combustível: ${carro.combustivel} <br>
                                    Valor: R$ ${carro.valor}
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>

        </div>

        <!-- Botões -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselCarros" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bg-dark rounded"></span>
        </button>

        <button class="carousel-control-next" type="button" data-bs-target="#carouselCarros" data-bs-slide="next">
            <span class="carousel-control-next-icon bg-dark rounded"></span>
        </button>

    </div>

</div>


<c:import url="/includes/footer.jsp" />
