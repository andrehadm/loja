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
                <li class="breadcrumb-item active">Relatórios</li>
                <li class="breadcrumb-item active">Balanço</li>
            </ol>
        </div>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:if test="${flash.warning}">
        <div class="alert alert-warning">${flash.warning}</div>
    </g:if>

    <div class="row">

        <div class="col-md-12">
            <h1>Balanço <small>Período entre <g:formatDate date="${inicio}" format="dd/MM/yyyy"/> e <g:formatDate date="${fim}" format="dd/MM/yyyy"/></small></h1>
            <hr>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Custo
                </div>
                <div class="card-body">
                    <p class="card-text">R$ ${custo}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Arrecadação
                </div>
                <div class="card-body">
                    <p class="card-text">R$ ${arrecadacao}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Lucro
                </div>
                <div class="card-body">
                    <p class="card-text">R$ ${lucro}</p>
                </div>
            </div>
        </div>
    </div>
    <br>

    <div class="row">
        <div class="col-md-12">

            <div class="card border-primary">
                <div class="card-header text-white bg-primary">
                    <h4>${totalVendas} Vendas</h4>
                </div>

                <div class="table-responsive">
                    <table class="table table-sm table-striped table-hover">
                        <thead>
                        <tr  style="background-color: #e3f2fd;">
                            <g:sortableColumn class="border-top-0" property="data" title="Data" />
                            <th class="border-top-0" >Tag</th>
                            <th class="border-top-0 text-center" >Valor da Compra</th>
                            <th class="border-top-0 text-center" >Valor da Venda</th>
                            <th class="border-top-0 text-center" >Lucro/Prejuízo</th>
                            <th class="border-top-0" ></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${listaDeResultados}" var="vendaInstance">
                            <tr>
                                <td style="vertical-align: middle; text-align: left"><g:formatDate date="${vendaInstance.data}" format="dd/MM/yyyy HH:mm:ss"/></td>
                                <td style="vertical-align: middle; text-align: left">${vendaInstance.tag}</td>
                                <td style="vertical-align: middle; text-align: center">${vendaInstance.compra.valor}</td>
                                <td style="vertical-align: middle; text-align: center">${vendaInstance.valor}</td>
                                <td style="vertical-align: middle; text-align: center">${vendaInstance.valor - vendaInstance.compra.valor}</td>
                                <td style="text-align: right; vertical-align: middle">
                                    <g:link class="btn btn-sm btn-outline-primary" action="show" controller="venda" id="${vendaInstance.id}" data-toggle="tooltip" title="Visualizar"><i class="fas fa-eye" aria-hidden="true"></i></g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
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