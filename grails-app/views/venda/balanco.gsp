<!doctype html>
<html>
<head>
    <meta name="layout" content="loja">
    <g:set var="entityName" value="Venda"/>
    <asset:stylesheet src="bootstrap-datepicker3.standalone.css"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-12">

            <h1>Balanço</h1>
            <hr>

            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:if test="${flash.danger}">
                <div class="alert alert-danger">${flash.danger}</div>
            </g:if>

            <g:hasErrors bean="${this.venda}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${this.venda}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <g:form class="form-horizontal" action="balanco_resultado">
                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="periodo">
                        Período
                    </label>

                    <div class="col-sm-5">
                        <g:textField name="dataInicio" id="dp1" class="form-control" value="" readonly="readonly" placeholder="Data inicial"/>
                    </div>
                    <div class="col-sm-5">
                        <g:textField name="dataFim" id="dp2" class="form-control" value="" readonly="readonly" placeholder="Data final"/>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-success">
                            Gerar
                        </button>
                    </div>
                </div>
            </g:form>
        </div>

    </div>

</div>
<asset:javascript src="bootstrap-datepicker.js"/>
<asset:javascript src="bootstrap-datepicker.pt-BR.min.js"/>

<script type="text/javascript">
    $(function () {
        $('#dp1').datepicker({
            format: "dd/mm/yyyy",
            orientation: "bottom auto",
            language: "pt-BR",
            autoclose: true
        });
        $('#dp2').datepicker({
            format: "dd/mm/yyyy",
            orientation: "bottom auto",
            language: "pt-BR",
            autoclose: true
        });
    });
</script>
</body>
</html>