package loja

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class VendaController {

    VendaService vendaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond vendaService.list(params), model:[vendaCount: vendaService.count()]
    }

    def show(Long id) {
        respond vendaService.get(id)
    }

    def create() {
        params.data = new Date()
        respond new Venda(params)
    }

    def balanco() {}

    def balanco_resultado() {
        Date dI = new Date()
        Date dF = new Date()

        if ((params.dataInicio == "") ||(params.dataFim == "")) {
            flash.message = "Datas não definidas."
            redirect(action: "balanco") //Depois mudar para uma outra tela
            return
        }


        //Criando as datas escolhidas pelo usuário
        if (params.dataInicio instanceof String) {
            dI = new Date().parse("dd/MM/yyyy", params.dataInicio)
        } else {
            dI = params.dataInicio
        }
        if (params.dataFim instanceof String) {
            dF = new Date().parse("dd/MM/yyyy", params.dataFim)
        } else {
            dF = params.dataFim
        }


        //Modifica a hora da data inicial para 00:00:00. Para poder ser usado todo o dia corrente
        dI.setHours(0)
        dI.setMinutes(0)
        dI.setSeconds(0)

        //Modifica a da data final para a hora da consulta. Para poder ser usado todo o dia corrente
        dF.setHours(23)
        dF.setMinutes(59)
        dF.setSeconds(59)

        println("Data final " + dF)

        if (dI > dF) {
            flash.message = "Intervalo de datas incorreto"
            redirect(action: "balanco") //Depois mudar para uma outra tela
        }

        println("Data inicial: " + dI + "  -  " + "Data final: " + dF)

        def results = Venda.findAll("from Venda v where v.data > ? and  v.data < ?",[dI,dF])

        def results2 = Venda.executeQuery("Select SUM(v.compra.valor), SUM(v.valor) from Venda v where v.data > ? and  v.data < ?",[dI,dF])


        println("Resultado" + results)

        println("Resultado 2" + results2)

        double custo = results2.get(0).getAt(0)
        double arrecadacao = results2.get(0).getAt(1)
        double lucro = arrecadacao - custo

        [listaDeResultados: results, inicio : dI, fim : dF, custo : custo, arrecadacao : arrecadacao, lucro : lucro, totalVendas: results.size()]
    }

    def save(Venda venda) {
        venda.data = new Date()
        if (venda == null) {
            notFound()
            return
        }

        try {
            vendaService.save(venda)
        } catch (ValidationException e) {
            respond venda.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'venda.label', default: 'Venda'), venda.id])
                redirect venda
            }
            '*' { respond venda, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond vendaService.get(id)
    }

    def update(Venda venda) {
        if (venda == null) {
            notFound()
            return
        }

        try {
            vendaService.save(venda)
        } catch (ValidationException e) {
            respond venda.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'venda.label', default: 'Venda'), venda.id])
                redirect venda
            }
            '*'{ respond venda, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        vendaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'venda.label', default: 'Venda'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
