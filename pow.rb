
$rand = Random.new
$mas = Array.new
for i in 0..1000 do
	$mas.push($rand.rand(0..100))
end
f = File.open("outputEncrypt.txt", "wb")
$text = "Hello hello."
$SarrayNum = $text.unpack "C*"
for i in 0..($SarrayNum.length-1) do
	p f.syswrite($mas[i])
end
p f.size
f.close
f = File.open("output.txt", "rb")
$aarr = ""
for i in 0..(f.size-1) do
	$aarr += f.sysread(1)
end
p "size=#{$aarr}"#.pack('C'*$aarr.size)
#p f.syswrite($mas)
#for i in 0..1000 do
#	f.writebyte($mas[i])
#end
	#f.write($mas)
	f.close

#file = File.new("myfile")
#e_count = 0
#file.each_byte do |byte|
# e_count += 1 if byte == ?e
#end
