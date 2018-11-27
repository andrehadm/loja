package loja

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CompraController {

    CompraService compraService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond compraService.list(params), model:[compraCount: compraService.count()]
    }

    def show(Long id) {
        respond compraService.get(id)
    }

    def create() {
        respond new Compra(params)
    }

    def save(Compra compra) {
        if (compra == null) {
            notFound()
            return
        }

        try {
            compraService.save(compra)
        } catch (ValidationException e) {
            respond compra.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compra.id])
                redirect compra
            }
            '*' { respond compra, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond compraService.get(id)
    }

    def update(Compra compra) {
        if (compra == null) {
            notFound()
            return
        }

        try {
            compraService.save(compra)
        } catch (ValidationException e) {
            respond compra.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Compra'), compra.id])
                redirect compra
            }
            '*'{ respond compra, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        compraService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
