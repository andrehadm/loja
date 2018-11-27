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

            <h1>Compra</h1>
            <hr>

            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:if test="${flash.danger}">
                <div class="alert alert-danger">${flash.danger}</div>
            </g:if>

            <g:hasErrors bean="${this.compra}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${this.compra}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <g:form class="form-horizontal" action="save">
                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="nome">
                        Nome
                    </label>

                    <div class="col-sm-10">
                        <g:textField name="nome" class="form-control ${hasErrors(bean: this.compra, field: 'nome', 'is-invalid')}" required=""
                                     value="${this.compra?.nome}"/>
                    </div>
                </div>

                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="valor">
                        Valor
                    </label>

                    <div class="col-sm-10">
                        <g:textField name="valor" class="form-control ${hasErrors(bean: this.compra, field: 'valor', 'is-invalid')}" required=""
                                     value="${this.compra?.valor}"/>
                    </div>
                </div>

                <div class="form-group row required">
                    <label class="col-sm-2 col-form-label" for="quantidade">
                        Quantidade
                    </label>

                    <div class="col-sm-10">
                        <g:textField name="quantidade" class="form-control ${hasErrors(bean: this.compra, field: 'quantidade', 'is-invalid')}" required=""
                                     value="${this.compra?.quantidade}"/>
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