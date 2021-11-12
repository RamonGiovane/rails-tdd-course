class Contador
  @qtd = 0
  
  def self.qtd
    @qtd
  end

  def self.incrmenta
    @qtd += 1
  end
end