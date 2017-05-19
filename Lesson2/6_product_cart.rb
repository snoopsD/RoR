puts "Если хотите остановить ввод, в названии товара введите stop"
puts "*" * 60

product_cart_name = Hash.new #товары с ценой за единицу
product_cart_csum = Hash.new #цена за единицу товара и количество
all_sum = [] # массив для подсчет итоговой стоимости

loop do

print  "Введите название товара: "
product_name = gets.chomp
break if product_name == "stop"

print "Введите цена за единицу товара: "
product_cost = gets.chomp.to_f

print "Введите количество купленного товара: "
product_sum = gets.chomp.to_f

product_cart_name.store(product_name, [product_cost,product_sum])

end
sum = 0
product_cart_name.each  {|item, (v1, v2) |
  puts "#{item}: #{v1} руб. #{v2} шт. Итого: #{v1 * v2} руб."
all_sum << v1*v2
}

print "Итоговая стоимость покупки: #{all_sum.inject(:+)} руб."
