
def powmod(b,x,m)
	if (x == 0)
		return 1
	end
	tmp = powmod(b, x / 2, m)
	if (x % 2 == 1)
		return (((tmp * tmp) % m) * b) % m
	else
		return (tmp * tmp) % m
	end
end
#puts "powmod(3,30,5)= "+powmod(3,30,5).to_s
#Тест Миллера — Рабина (проверка числа на простоту)
def MillerRabdoubleest(n, k)
#p "1n=#{n}"
	if (n <= 1)
		#p "ret n<=1"
		return false
		end
	if (n == 2)
		#p "ret n==2"
		return true
		end
	if ((n.remainder 2) == 0)
		#p "ret n.fdiv 2 == 0"
		return false
		end
	s = 0
	d = n - 1
	while ((d.remainder 2) == 0) do
	
		d /= 2
		s += 1
	end
	rndl = Random.new
	randNum = rndl.rand(n) + 2
	for i in 0..k do
		a = randNum.remainder(n - 1)
		x = powmod(a, d, n)
		if (x == 1 || x == n - 1)
			next
			end
		for j in 0..(s - 1) do
		
			x = (x*x).remainder n
			if (x == 1)
				#p "ret x == 1"
			
			return false
				end
			if (x == n - 1)
				break
				end
		end
		if (x != n - 1)
			#p "ret x != n-1"
			return false
			end
	end
	#p "ret"
	return true
end

def getPrimeNumber(min, max)
  randNum = 0
  test = false
  rndl = Random.new
	begin
		random = rndl.rand(min..max)
		
		k = Math.log2(random)
		#p "rand "+random.to_s+" k "+k.round.to_s
		test = MillerRabdoubleest(random, k.round)
		#p test.to_s
		#gets.chomp
	end while test == false
	return random
end

#взаимная простота, возвращает наибольший делитель
def gcd(x, y)
	return y>0 ? gcd(y, (x.remainder y)) : x
end

def extendedEuclid(a, b, xx=0, yy=0, dd=0)
	#объявим матрицу Е
	#e11, e12, e21, e22
	#объявим целую часть от деления и остаток
	#q, r
	#N2 = 0
	@N = a
	#qNeg, E12, E22
	#заполним матрицу
	@e11 = 1
	@e12 = 0
	@e21 = 0
	@e22 = 1
	#если b равен 0
	if (b == 0)
	dd = a
	xx = 1
	yy = 0
	end
	#пока b не 0
	while (b > 0) do
		@q = a / b
		@r = a - b*@q
		@qNeg = @N - @q
		@E12 = (@e11 + (@qNeg*@e12)%@N)%@N
		@E22 = (@e21 + (@qNeg*@e22)%@N)%@N
		@e11 = @e12
		@e21 = @e22
		@e12 = @E12
		@e22 = @E22
		a = b
		b = @r
	end
	return @e21
end

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


$text = File.read("input.txt")
minNumber = 2**59
maxNumber = 2**63
p "maxNumber= #{maxNumber} maxNumber.length= #{maxNumber.to_s(2).length}"
rnd = Random.new

$P = getPrimeNumber(minNumber, maxNumber)
$Q = getPrimeNumber(minNumber, maxNumber)
puts "P= #{$P} Q= #{$Q}"
$N = $P*$Q
p "N=#{$N} class=#{$N.class} id=#{$N.object_id} 2.length= #{$N.to_s(2).length}"
$M = ($P-1)*($Q-1)
p "M=#{$M}"
begin
	$D = rnd.rand(minNumber..($M-1))
end while (gcd($M,$D) != 1)
p "D=#{$D}"
$EE = extendedEuclid($M,$D)
p "EE=#{$EE}"
#тестирование функций
$T = $N-5
$encrypt = powmod($T, $EE, $N)
p "encrypt= #{$encrypt}"
$dencrypt = powmod($encrypt, $D, $N)
if($dencrypt == $T)
	p "dencrypt true"
else
	p "dencrypt false"
end

$arrayNum = $text.unpack "C*" #преобразовали строку в массив чисел
#$str7 = $arrayNum[0].to_s
$i=0
$k=0
$arrayStr = []
while ($i<$arrayNum.length)
	if($k==0)
		$str7 = $arrayNum[$i].to_s
	else
		$str7 += $arrayNum[$i].to_s
	end
	$k += 1
	if($k==14)
		$arrayStr << $str7
		$k=0
	end
	$i += 1
end
if($k>0)
	$arrayStr << $str7
end
$arrayOfEncrypt = []
for i in 0..($arrayStr.length-1) do
	$arrayOfEncrypt << powmod($arrayStr[i].to_i,$EE, $N)
end

#p "$str7.length= #{$str7.to_i.to_s(2).length}"
#$x = $str7.to_i
#$crypt = powmod($x,$min,$max)
#$str8 = $crypt.to_s(2)



