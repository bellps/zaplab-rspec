# frozen_string_literal: true

# Uma calculadora massa
class Calculadora
  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
  end

  def soma
    num1 + num2
  end

  def subtrair
    num1 - num2
  end

  def multiplicar
    num1 * num2
  end

  def dividir
    num1 / num2
  rescue ZeroDivisionError
    'Impossível dividir por zero.'
  end

  private

  attr_accessor :num1, :num2
end
