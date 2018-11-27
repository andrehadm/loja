<!doctype html>
<html>
<head>
    <meta name="layout" content="loja">
    <g:set var="entityName" value="Compra"/>

</head>

<body>
<div class="container-fluid">


    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${createLink(uri: '/')}">Início</a></li>
                <li class="breadcrumb-item active">Vendas</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">

            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>

            <g:if test="${flash.warning}">
                <div class="alert alert-warning">${flash.warning}</div>
            </g:if>


            <div class="card-deck">
                <g:each in="${compraList}" var="compraInstance">
                    <div class="card">
                        <h5 class="card-header">${compraInstance.nome}</h5>
                        <div class="card-body">
                            <h5 class="card-title">Estoque</h5>
                            <p class="card-text">Quantidade disponível: ${compraInstance.quantidade}</p>
                            <g:link class="btn btn-primary" action="create" controller="venda" params="[compra: compraInstance.id]" data-toggle="tooltip" data-placement="top" title="Vender"><i class="fas fa-cart-plus"></i></g:link>
                        </div>
                    </div>
                </g:each>

            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>