
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


