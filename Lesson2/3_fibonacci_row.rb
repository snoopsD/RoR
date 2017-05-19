# Заполнить массив числами фибоначчи до 100
array_fib = []
n = 1
m = 2

while n < 100
    array_fib << n
    n, m = m, n+m
end

print array_fib
