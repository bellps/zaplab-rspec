# frozen_string_literal: true

require './calculadora'

RSpec.describe Calculadora do
  subject { described_class.new(10, 5) }

  describe '#new' do
    it 'inicializa uma instância da classe calculadora' do
      is_expected.to be_instance_of Calculadora
    end
  end

  describe '#soma' do
    it 'soma dois números' do
      expect(subject.soma).to eq 15
    end
  end

  describe '#subtrair' do
    it 'subtrai dois números' do
      expect(subject.subtrair).to eq 5
    end
  end

  describe '#multiplicar' do
    it 'multiplica dois números' do
      expect(subject.multiplicar).to eq 50
    end
  end

  describe '#dividir' do
    context 'quando o divisor é diferente de zero' do
      it 'divide dois números' do
        expect(subject.dividir).to eq 2
      end
    end

    context 'quando o divisor é igual a zero' do
      subject { Calculadora.new(10, 0) }

      it 'exibe mensagem de divisão impossível' do
        expect(subject.dividir).to eq 'Impossível dividir por zero.'
      end
    end
  end
end
