# Прямоугольный треугольник
sides = [] #инициализируем массив для храниения длин сторон

print "Введите первую сторону треугольника: "
sides[0] = gets.chomp.to_f

print "Введите вторую сторону  треугольника: "
sides[1]= gets.chomp.to_f

print "Введите третью сторону треугольника: "
sides[2] = gets.chomp.to_f

sorted_sides = sides.sort! # сортируем входные данные для определения гипотенузы

if (sorted_sides[0] == sorted_sides[1]) && sorted_sides[0] == sorted_sides[2]
  puts "Треугольник не является прямоугольным, он равносторонний и равнобедренный!"
elsif sorted_sides[0] == sorted_sides[1]
  puts "Треугольник является равнобедеренным"
elsif sorted_sides[2]**2 == sorted_sides[0]**2 + sorted_sides[1] ** 2
  puts "Треугольник является прямоугольным"
else
  puts "Треугольник не является прямоугольным"
end

gets
