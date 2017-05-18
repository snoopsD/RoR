#Заполнить хеш гласными буквами,
#где значением будет являтся порядковый номер буквы в алфавите (a - 1)

vowels = %w[а у о ы и э я ю е]
alphabet = ('а'..'я').to_a

h_vowels = Hash.new

i = 0

vowels.each {|letter| if alphabet.include?letter
   h_vowels = { "#{vowels[i]}" => "#{alphabet.index(letter)+1}".to_i}
   i += 1
 end
}
 puts h_vowels
