class Table
  attr_reader :table
  def initialize(table, *recaudaciones)
    @table = table
    @recaudaciones = *recaudaciones.map(&:to_i)
  end
  def total
    @recaudaciones.inject(&:+) #/ @recaudaciones.size (promedio)
  end
  def mayor
    @recaudaciones.max
  end
  def dia
    @recaudaciones.index{|x| x == self.mayor} + 1
  end
  def promedio
    self.total / @recaudaciones.size
  end
end

recaudaciones_total = []
data = []
File.open('casino.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
  ls = prod.split(', ')
  recaudaciones_total << Table.new(*ls)
end

prom_total = 0
recaudaciones_total.each do |product|
  puts product.table
  puts product.total
  puts "el mayor de esta mesa es #{product.mayor}, carresponde al dia #{product.dia}"
  #puts product.promedio
  prom_total += product.promedio
end

puts "el promedio de todas las mesas y todos los dias es #{prom_total / recaudaciones_total.size}"
