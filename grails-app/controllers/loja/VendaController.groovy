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
