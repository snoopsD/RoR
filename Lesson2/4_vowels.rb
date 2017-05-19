#Заполнить хеш гласными буквами,
#где значением будет являтся порядковый номер буквы в алфавите (a - 1)

vowels = %w[а у о ы и э я ю е]
alphabet = ('а'..'я').to_a
h_vowels = {}

i = 0

#как я понимаю в руби у русского алфавита 32 буквы. Е и Ё одиннаковые для него.
vowels.each {|letter| if alphabet.include?letter
   h_vowels["#{vowels[i]}"] = "#{alphabet.index(letter)+1}"
   i += 1
 end
}
puts h_vowels
