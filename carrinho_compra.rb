class CarrinhoCompra
  attr_accessor :itens

  def initialize
    @itens = []
  end

  def adicionar(nome = '')
    return 'Você precisa adicionar um nome!' if nome.empty?

    existe = false

    itens.each do |item|
      next unless item[:nome] == nome

      item[:quantidade] += 1
      existe = true

      break
    end

    return if existe

    item = { nome: nome, quantidade: 1 }
    itens << item
  end

  def verificar_quantidade(nome)
    retorno = 0

    itens.each do |item|
      next unless item[:nome] == nome

      retorno = item[:quantidade]
      break
    end

    retorno
  end

  def remover_todos
    @itens = []
  end

  def remover(nome)
    retorno = itens.reject! { |item| item[:nome] == nome }

    return 'O item não existe no carrinho' if retorno.nil?
  end
end
