package loja

class Venda {

    String tag
    double valor
    Date data

    static belongsTo = [compra : Compra]

    static constraints = {
        tag(nullable: false, blank: false)
        valor(nullable: false)
        data(nullable: true)
    }
}
