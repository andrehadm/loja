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
                <li class="breadcrumb-item active">Compras</li>
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
                            <h4>Compras</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <b>Nome:</b> ${this.compra.nome} <br>
                                    <b>Valor:</b> ${this.compra.valor} <br>
                                    <b>Quantidade:</b> ${this.compra.quantidade} <br>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-12">
                                    <g:link class="btn btn-warning" action="edit" resource="${this.compra}" data-toggle="tooltip" title="Editar"><i class="fa fa-edit"></i></g:link>
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