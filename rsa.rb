#coding: windows-1251
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

def powMod(base, exp, modulo)
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
def addToLeftZero(num, length, txt)
	@n = num
	if (num.length>length)
		p "Error addToLeftZero: "+txt
		#gets.chomp
	end
	0.upto(length-@n.length-1){|i| @n.insert(0,"0")}
	return @n
end

class RSAclient

	def initialize(options={})
	@size = options[:size]
	end

	# Наш геттер для свойства 
	def size
	@size
	end
	# Устанавливаем сеттер для свойства рос
	def size=(size)
	@size = size
	end
end
#$text = File.read("intupsmall.txt","r:windows-1251")
f = File.open("input.txt")
$text = f.read
p "text.length= #{$text.length} text=<"+$text+">"
f.close
=begin
$arrayNum = []
$ff = File.new("intupsmall.txt","r")
p "ff.size=#{$ff.size}"
0.upto($ff.size-3){|i| $arrayNum<<$ff.getbyte}
$ff.close
$text = $arrayNum.to_s
p "text.length= #{$text.length} text=<"+$text+">"
=end

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
$encrypt = powMod($T, $EE, $N)
p "encrypt= #{$encrypt}"
$dencrypt = powMod($encrypt, $D, $N)
if($dencrypt == $T)
	p "dencrypt true"
else
	p "dencrypt false"
end

$arrayNum = $text.unpack "C*" #преобразовали строку в массив чисел
p $arrayNum[0..$arrayNum.size-1]
#$str7 = $arrayNum[0].to_s
$i=0
$k=0
$arrayStr = []
while ($i<$arrayNum.length)
	if($k==0)
		$str7 = addToLeftZero($arrayNum[$i].to_s(2),8,"Partition text of numbers")
	else
		$str7 += addToLeftZero($arrayNum[$i].to_s(2),8,"Partition text of numbers")
	end
	$k += 1
	if($k==15)
		$arrayStr << $str7
		$k=0
	end
	$i += 1
end
if($k>0)
	$arrayStr << $str7
end
p "massiv bit= " + $arrayStr[$arrayStr.length-1]+" %8= #{$arrayStr[$arrayStr.length-1].length%8} /8= #{$arrayStr[$arrayStr.length-1].length/8}"
#добавили в массив последний блок и приступаем к шифрованию
$arrayOfEncrypt = []
for i in 0..($arrayStr.length-1) do
	$arrayOfEncrypt << addToLeftZero(powMod($arrayStr[i].to_i(2),$EE, $N).to_s(2),128,"Partition encrypt for blocks")
end
$arrayOfEncryptBytes = []
$x = 0
#приступаем к разбиению зашифрованных блоков
for i in 0..($arrayOfEncrypt.length-1) do
	while($x < 128)
		$arrayOfEncryptBytes << $arrayOfEncrypt[i][$x..$x+7].to_i(2)
		$x += 8
	end
	$x = 0
#0.step(by: 8, to: 127){|x| $arrayOfEncryptBytes << $arrayOfEncrypt[i][x..x+7].to_i(2)}
end
p "arrayOfEncryptBytes.length= #{$arrayOfEncryptBytes.length}"
p "Encrypt array= #{$arrayOfEncryptBytes[0..$arrayOfEncryptBytes.length-1]}"
#начало процесса расшифровки
$i=0
$k=0
$arrayStr = []
while ($i<$arrayOfEncryptBytes.length)
	if($k==0)
		$str7 = addToLeftZero($arrayOfEncryptBytes[$i].to_s(2),8,"Partition encrypt text of numbers")
	else
		$str7 += addToLeftZero($arrayOfEncryptBytes[$i].to_s(2),8,"Partition encrypt text of numbers")
	end
	$k += 1
	if($k==16)
		$arrayStr << $str7
		$k=0
	end
	$i += 1
end
#приступаем к расшифрованию
$arrayOfDencrypt = []
for i in 0..($arrayStr.length-2) do
	$arrayOfDencrypt << addToLeftZero(powMod($arrayStr[i].to_i(2),$D, $N).to_s(2),120,"Partition dencrypt for blocks")
end
$tempX = powMod($arrayStr[$arrayStr.length-1].to_i(2),$D, $N).to_s(2)
$tempXl = $tempX.length / 8
if ($tempX.length % 8 > 0)
	$tempXl+=1
end
$tempXl = $tempXl*8
p "tempXl=#{$tempXl}"
$arrayOfDencrypt << addToLeftZero($tempX,$tempXl,"Partition dencrypt for blocks")
$arrayOfDencryptBytes = []
#приступаем к разбиению расшифрованных блоков
for i in 0..($arrayOfDencrypt.length-2) do
0.step(by: 8, to: 119){|x| $arrayOfDencryptBytes << $arrayOfDencrypt[i][x..x+7].to_i(2)}
end
0.step(by: 8, to: $tempXl-1){|x| $arrayOfDencryptBytes << $arrayOfDencrypt[$arrayOfDencrypt.length-1][x..x+7].to_i(2)}


$textDecript = $arrayOfDencryptBytes.pack('C'*$arrayOfDencryptBytes.size)#преобразовали строку в массив чисел
p "massiv bites=#{$arrayOfDencryptBytes[0..$arrayOfDencryptBytes.length-1]}"
p "massiv chars=#{$textDecript[0..$textDecript.size-1]}"
p "Resalt text size - #{$textDecript.length}"
f = File.open("output.txt", "w")
f.write($textDecript)
f.close
#$text = $textDecript.pack "C*"
#p $text
#File.open("output.txt","w") do |f|
#	f.puts $textDecript
#	end
#0.upto($arrayOfEncrypt.length-1){|i| }

#$str8bit=$arrayOfEncrypt[0][0,7]
#p $str8bit
#
#p "11".to_i(2)
#p "$str7.length= #{$str7.to_i.to_s(2).length}"
#$x = $str7.to_i
#$crypt = powMod($x,$min,$max)
#$str8 = $crypt.to_s(2)



