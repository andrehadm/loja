<!doctype html>
<html>
<head>
    <meta name="layout" content="loja">
    <g:set var="entityName" value="Venda"/>

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

            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card border-primary">
                        <div class="card-header text-white bg-primary">
                            <h4>Venda</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <b>Tag:</b> ${this.venda.tag} <br>
                                    <b>Data:</b> <g:formatDate date="${this.venda.data}" format="dd/MM/yyyy HH:mm:ss"/> <br>
                                    <b>Valor da Compra:</b> R$ ${this.venda.compra.valor} <br>
                                    <b>Valor da Venda:</b> R$ ${this.venda.valor} <br>
                                    <b>Lucro/Prejuízo:</b> R$ ${this.venda.valor - this.venda.compra.valor} <br>
                                    <b>Data:</b> <g:formatDate date="${this.venda.data}" format="dd/MM/yyyy HH:mm:ss"/> <br>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-12">
                                    <g:link class="btn btn-warning" action="edit" resource="${this.venda}" data-toggle="tooltip" title="Editar"><i class="fa fa-edit"></i></g:link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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