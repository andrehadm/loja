package loja

class Compra {
    String nome
    double valor
    int quantidade

    static hasMany = [vendas : Venda]

    static constraints = {
        nome(nullable: false, blank: false)
        valor(nullable: true)
        quantidade(nullable:true)
    }

}
