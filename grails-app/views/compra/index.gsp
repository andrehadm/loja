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


            <div class="card border-primary">
                <div class="card-header text-white bg-primary">
                    <h4>Compras
                            <g:link class="btn btn-sm btn-outline-light float-right" action="create" controller="compra"  data-toggle="tooltip" data-placement="top" title="Adicionar"><i class="fas fa-plus"></i></g:link>
                    </h4>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr  style="background-color: #e3f2fd;">
                            <th class="border-top-0" >Nome</th>
                            <th class="border-top-0" >Quantidade</th>
                            <th class="border-top-0" ></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${compraList}" var="compraInstance">
                            <tr>
                                <td style="vertical-align: middle; text-align: left">${compraInstance.nome}</td>
                                <td style="vertical-align: middle; text-align: left">${compraInstance.quantidade}</td>
                                <td style="text-align: right; vertical-align: middle">
                                    <g:link class="btn btn-sm btn-outline-primary" action="show" controller="compra" id="${compraInstance.id}" data-toggle="tooltip" title="Visualizar"><i class="fas fa-eye" aria-hidden="true"></i></g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="paginacao">
                <g:paginate total="${compraCount}"/>
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