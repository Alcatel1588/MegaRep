
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

p "functtion"

$N = powmod(314534534534534534,6445345234324233454,3145345345345345343) #

p "N= #{$N}"