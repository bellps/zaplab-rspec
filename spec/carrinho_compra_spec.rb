# frozen_string_literal: true

require './carrinho_compra'

RSpec.describe CarrinhoCompra do
  subject { described_class.new }

  describe '#new' do
    it 'inicializa um carrinho de compra' do
      is_expected.to be_instance_of CarrinhoCompra
    end
  end

  describe '#adicionar' do
    context 'quando o item não existe' do
      context 'quando fornece o nome' do
        it 'adiciona item no carrinho' do
          expect { subject.adicionar('placa de video') }.to change { subject.itens.count }.from(0).to(1)
        end
      end

      context 'quando não fornece o nome' do
        it 'retorna mensagem de erro' do
          expect(subject.adicionar).to eq 'Você precisa adicionar um nome!'
        end
      end
    end

    context 'quando o item já existe' do
      it 'não duplica o item' do
        subject.adicionar('placa de video')
        expect { subject.adicionar('placa de video') }.not_to change { subject.itens.size }
      end

      it 'incrementa o item em uma unidade' do
        2.times { subject.adicionar('placa de video') }
        expect(subject.verificar_quantidade('placa de video')).to eq 2
      end
    end
  end

  describe '#verificar_quantidade' do
    it 'retorna quantidade do item desejado' do
      subject.adicionar('placa de video')
      expect(subject.verificar_quantidade('placa de video')).to eq 1
    end
  end

  describe '#remover_todos' do
    it 'remove todos os itens' do
      subject.adicionar('placa de video')
      subject.adicionar('monitor')
      expect { subject.remover_todos }.to change { subject.itens.size }.from(2).to(0)
    end
  end

  describe '#remover' do
    before do
      subject.adicionar('placa de video')
      subject.adicionar('monitor')
    end

    context 'quando o item existe no carrinho' do
      it 'remove o item' do
        expect { subject.remover('monitor') }.to change { subject.itens.size }.from(2).to(1)
      end
    end

    context 'quando o item não existe no carrinho' do
      it 'informa mensagem de erro' do
        expect(subject.remover('carro')).to eq 'O item não existe no carrinho'
      end
    end
  end
end
