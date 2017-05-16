print "Введите Ваше имя: "
name = gets.capitalize.chomp #имя пользователя

print "Введите Ваш рост в см: "
height = gets.to_i # рост пользователя в см

ideal_weight = height - 110 #формула идеального веса

if ideal_weight < 0 
  puts "#{name}, Ваш веc уже оптимальный"

else
  puts "#{name}, Ваш вес #{ideal_weight} кг"

end
