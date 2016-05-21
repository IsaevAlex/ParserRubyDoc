require 'prime'
require  'rsa'
include RSA::Math

class RsA 
    attr_accessor :t,:N

    # Метод для генерирования простых чисел
    def generating_p_q
		numbers = Prime.take(100)
		@p = numbers.sample  #р присвоили простое число
		@q = numbers.sample  #q присвоили простое число
		
		puts "p пользователя  равен: #{@p}"
		puts "q пользователя  равен: #{@q}"
	end
    
    #метод для вычисления N
    def calculation_N
        @N = @p * @q

        puts "N пользователя  равен: #{@N}" 
    end

    #вычисляем f
	def calculation_f
    	@f = (@p-1)*(@q-1)

    	puts "f пользователя  равен: #{@f}" 
    end

    #метод для генерации e
    def random_e
    	@e = rand(100)
    	while !RSA::Math.coprime?(@e,@f) do #проверяем на взаимную простоту числа e,d
			@e = rand(100)
		end

		puts "e пользователя  равен: #{@e}" 
		puts RSA::Math.coprime?(@e,@f)
    end

    #вычисляем закрытый ключ d с помощью расширенного алгоритма Евклида
    def egcd
		@d = RSA::Math.egcd(@e,@f) 
		if @d[0] > 0 
			@t = @d[0]
		else	
			@t = @d[0] + @f 
		end

		puts "d пользователя  равен: #{@d}"
		puts "t пользователя  равен: #{@t}"

    end
   
    #метод для ввода сообщения
   	def putting_word
		print "Введите слово:"
		@word = gets.chomp
		
		@@array = @word.codepoints.to_a # превращает в массив байтов
     	puts "array равен #{@@array}"
	end
    
    #пользователь А  шифрует сообщение своим закрытым ключом. В 
    #результате этих действий пользователь А подписывает сообщение.
    def user_A_crypt_private_key
    	@@c = []

    	@@array.each do |number|
			@@c.push(number ** @e % @N) 
		end

		@@array.clear
		puts "c равен #{@@c}"
		
	end

	#шифрует то, что получилось на шаге 1 открытым ключом пользователя Б.
    def user_A_crypt_public_key(a,b)	
    	@@g = []

		@@c.each do | number |
			@@g.push(number ** a % b)	
		end

		@@c.clear
		puts "g равен #{@@g}"
		
	end 
   
   # сообщение расшифровывается. закрытм ключом пользователя B
	def user_B_crypt_private_key
		@@g.each do | number | 
			@@c.push(number ** @e % @N) 
		end

		puts "c равен #{@@c}"  
		
	end
    
    #производится проверка подписи пользователя А c помощью открытого ключа пользователя A
	def user_B_crypt_public_key(a,b)
    	@@c.each do | number |
			@@array.push(number ** a % b) 
		end

		print "array равен #{@@array}"
		puts " "

		print "Cлово: #{ @@array.pack('U*')}"
    end

    private

		#производится вывод всех объектов
    	def index
    	end
end





Alice = RsA.new
Alice.generating_p_q
Alice.calculation_N
Alice.calculation_f
Alice.random_e
Alice.egcd
Alice.putting_word
puts " "

Bob = RsA.new
Bob.generating_p_q
Bob.calculation_N
Bob.calculation_f
Bob.random_e
Bob.egcd
puts " "

Alice.user_A_crypt_private_key
Alice.user_A_crypt_public_key(Bob.t,Bob.N)
Bob.user_B_crypt_private_key
Bob.user_B_crypt_public_key(Alice.t,Alice.N)


