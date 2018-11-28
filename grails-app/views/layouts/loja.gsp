<!doctype html>
<html lang="pt-br" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Mary Toda Bella
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!Configuração do Bootstrap-->
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="bootstrap-grid.css"/>
    <asset:stylesheet src="bootstrap-reboot.css"/>
    <asset:stylesheet src="all.css"/>
    <asset:javascript src="jquery-3.2.1.js"/>
    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="bootstrap.js"/>

    <asset:stylesheet src="paginacao.css"/>

    <asset:link rel="icon" href="favicon.png" type="image/png" />

    <g:layoutHead/>
</head>
<body>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="${createLink(uri: '/')}">Mary Toda Bella</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <div class="navbar-nav mr-auto">
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Menu
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <g:link class="dropdown-item" controller="Compra" action="index">Compra</g:link>
                        <g:link class="dropdown-item" controller="Compra" action="venda">Venda</g:link>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Relatórios
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <g:link class="dropdown-item" controller="compra" action="index">Inventário</g:link>
                        <g:link class="dropdown-item" controller="Venda" action="index">Histórico</g:link>
                        <g:link class="dropdown-item" controller="Venda" action="balanco">Balanço</g:link>
                    </div>
                </div>

            <div class="nav-item">
                <g:form class="form-inline my-2 my-lg-0" action="pesquisarTag" controller="venda">
                    <g:textField name="tag" class="form-control mr-sm-2"  required="" value="" placeholder="Tag da venda" aria-label="Search" autocomplete="off"/>

                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Pesquisar</button>
                </g:form>
            </div>

        </div>

    </div>
</nav>

<br>
<br>
<br>

<g:layoutBody/>

<div class="container-fluid">
    <hr>
    <footer style="text-align: center">
        <p>&copy; ${new Date().getYear() + 1900} - Mary Toda Bella.</p>
    </footer>
</div>

<g:javascript>
    $(function() {
        // Setup drop down menu
        $('.dropdown-toggle').dropdown();

        // Fix input element click problem
        $('.dropdown input, .dropdown label').click(function(e) {
            e.stopPropagation();
        });
    });
</g:javascript>

</body>
</html>