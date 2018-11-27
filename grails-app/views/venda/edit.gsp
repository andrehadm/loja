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

            <h1>Venda</h1>
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

            <g:form resource="${this.venda}" action="update" method="PUT">
                <g:hiddenField name="version" value="${this.venda?.version}" />
                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="tag">
                        Tag
                    </label>

                    <div class="col-sm-10">
                        <g:textField name="tag" class="form-control ${hasErrors(bean: this.venda, field: 'tag', 'is-invalid')}" required=""
                                     value="${this.venda?.tag}"/>
                    </div>
                </div>

                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="valor">
                        Valor
                    </label>

                    <div class="col-sm-10">
                        <g:textField name="valor" class="form-control ${hasErrors(bean: this.venda, field: 'valor', 'is-invalid')}" required=""
                                     value="${this.venda?.valor}"/>
                    </div>
                </div>

                <g:hiddenField name="compra.id" readonly="readonly" class="form-control" value="${venda?.compra?.id}"/>

                <div class="form-group row ${hasErrors(bean: venda, field: 'compra', 'is-invalid')} required">
                    <label class="col-sm-2 col-form-label" for="compra">
                        Compra
                    </label>

                    <div class="col-sm-10">
                        <g:select name="compra" class="form-control" required="" from="${loja.Compra.list()}" optionKey="id" value="${venda?.compra?.id}" optionValue="nome"/>
                    </div>
                </div>


                <div class="form-group row">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-success">
                            Salvar
                        </button>
                    </div>
                </div>
            </g:form>
        </div>

    </div>

</div>
</body>
</html>