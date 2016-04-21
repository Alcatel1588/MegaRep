
def powmod(base, exp, modulo)
    @res = 1
    
    while (exp != 0) do
        if ((exp & 1) != 0)
        
            @res = (@res * base) % modulo
        end
        
        base = (base * base) % modulo
        exp >>= 1
    end
    
    return @res
end

p "function"
$min = 2**57
$max = 2**64
$N = powmod(7,$min,$max)
p "N= #{$N}"
p "N.length= #{$N.to_s(2).length}"

#f = File.open("new1.txt","r")
$text = []
$text = File.read("new1.txt")
p "/7= #{$text.length / 7}" 
p "%7= #{$text.length % 7}"
$arrayNum = $text.unpack "C*" #преобразовали строку в массив чисел
$str7 = $arrayNum[0].to_s
for i in 1..6 do
	$str7 += $arrayNum[i].to_s
	end
p "$str7.length= #{$str7.to_i.to_s(2).length}"
$x = $str7.to_i
$crypt = powmod($x,$min,$max)
$str8 = $crypt.to_s(2)
