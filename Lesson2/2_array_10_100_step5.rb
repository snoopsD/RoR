# Заполнить массив числами от 10 до 100 с шагом 5
numbers = []

for i in 10..100
  if i % 5 == 0
 numbers << i
 end
 end
 print numbers
