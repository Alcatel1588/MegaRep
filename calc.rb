puts 1.0 + 2.0
puts 2.0 * 3.0
puts 5.0 - 8.0
puts 9.0 / 2.0
puts 'Приветик, ну и как Вас зовут?'
#name = gets.chomp
#puts 'Вас зовут ' + name + '?  Какое прекрасное имя!'
#puts 'Рад познакомиться с Вами, ' + name + '.  :)'

def sum(a, b)
  puts "#{a} + #{b} = #{a+b}"
end
#puts 1234
sum(1, 9) #=>  puts "#{a} + #{b} = #{a+b}"

def sum(a=5,b=6,c)
  puts a,b,c
end

sum 2
#5
#6
#2

sum 2,3
#2
#6
#3

def do_collection(m,*strings)
  result = []
  strings.each{|str| result << str.send(m)}
  return result
end

collection = %w{hello readers}
#=> ["hello",  "readers"]

p result_collection = do_collection(:upcase,*collection)
#=> ["HELLO",  "READERS"]

p result_collection = do_collection(:downcase,*result_collection)
#=> ["hello", "readers"]

def create_point(x, y, color: "white", size: 1, **h)
		p [x, y, color, size, h]
	end
create_point(2, 3, style: "solid", styler: "blue")

def multisum(a,b=5,*c)
  sum = c.inject{|sum, num| sum += num}
  sum*a*b
end

multisum(5, *[1, 2, 3, 4, 5]) #=> 70

def multisum(arg)
  sum = arg[:collection].inject{|sum, num| sum += num}
  sum * arg[:a] * arg[:b]
end

multisum({a:5, b:1, collection:[2,3,4,5]}) #=> 70

class A
  def self.hello
    puts 'hello'
  end
  def bye
    puts 'bye'
  end
end

A.hello #hello

A.new.bye #bye

"hello".upcase #=> "HELLO"
"hello".send(:upcase) #=> "HELLO"

class A
  define_method :hello do
    puts 'hello'
  end
end

A.new.hello # hello


a = A.new
a.define_singleton_method(:bye) do |name|
  puts "Hello, #{name}"
end #=> #<Proc:0x86df814@(irb):18 (lambda)>

a.bye('Vladimir') #Hello, Vladimir

hash = {'hello' => 'goodbye', 1 => "Hey!", [1]=>[1,2,3,4,5]} #=> {"hello"=>"goodbye", 1=>"Hey!", [1]=>[1, 2, 3, 4, 5]}

hash['hello'] #=> "goodbye"
hash[1] #=> "Hey!"
hash[[1]] #=> [1, 2, 3, 4, 5]
hash[[1]][1] #=> 2 

fruits = []
fruits << {"name"=>"banana", "cost"=>10} << {"name"=>"apple", "cost"=>7}
#=> [{"name"=>"banana", "cost"=>10}, {"name"=>"apple", "cost"=>7}]

'hello world'.object_id #=> 70115500
'hello world'.object_id #=> 70106870
'hello world'.object_id #=> 70104250
'hello world'.object_id #=> 70101670
:hello_world.object_id #=> 186168
:hello_world.object_id #=> 186168
:hello_world.object_id #=> 186168
5.object_id #=> 11
5.object_id #=> 11
5.object_id #=> 11

user = {name:"Vasya", last_name: "Petrov", age: 20}
user[:name] #=> "Vasya"
user[:last_name] #=> "Petrov"
user["last_name".to_sym] #=> "Petrov" 

hash = Hash.new{|h,k| h[k] = k} #=> {}
hash[:a] #=> :a
hash #=> {:a=>:a}

hash = Hash[1,2,3,4,5,6] #=> {1=>2, 3=>4, 5=>6}
hash = Hash[:a,1,:b,2,:array, [1,2,3,4]] #=> {:a=>1, :b=>2, :array=>[1, 2, 3, 4]}
hash = Hash[[[:a,:b,:c,:d],[1,2,3,4]].transpose] #=> {:a=>1, :b=>2, :c=>3, :d=>4}

h=Hash.new #=> {}
h[:a] #=> nil
h.default = 'text'
h[:a] #=> "text"
h[:b] #=> "text"

h = {a: 100, b: 200, c: 300}
h.invert #=> {100=>:a, 200=>:b, 300=>:c}

[[:foo, :bar], [1, 2]].to_h # => {:foo => :bar, 1 => 2}

hash #=> {1=>2, 3=>4}
hash.to_a #=> [[1, 2], [3, 4]]

hash.to_a.flatten #=> [1, 2, 3, 4] 

[] #=> []
array = Array.new #=> []
array = Array[]
array = %w{hello (0..10) 6 7 world} #=> ["hello", "(0..10)", "6", "7", "world"]

array = ["Welcome", "love", "to", "world"] #=> ["Welcome", "love", "to", "world"]

array[4] = "STRING"
array[5] = (2..5)
array[6] = 12
array[7] = 5.78
array[8] = [1, 2, 3, "hello"]

array #=> ["Welcome", "love", "to", "world"]
array[0] #=> "Welcome"
array[5] #=> 2..5
array[8] #=> [1, 2, 3, "hello"]

a = []
a[0] = 1
a[5] = 2

a #=> [1, nil, nil, nil, nil, 2] 

a = %w{Welcome love  [1,2,3]}
#=> ["Welcome", "love", "[1,2,3]"]

a = Array.new(10){|elem| elem.odd? ? elem**2 : elem**3}
#=> [0, 1, 8, 9, 64, 25, 216, 49, 512, 81] 

array = [1,2,3] 

array = [1,nil,3,nil]
array[0] #=> 1
array[2] #=> 3
array[3] #=> nil

array[0,2] #=> [1, 2]
array[0..2] #=> [1, 2, 3]

array[1..array.size] #=> [2, 3] 

ary = [0, 4, 7, 10, 12] 
ary.bsearch {|x| x >= 6 } 

array.first #=> 1
array.last #=> 3

array = [1, 2, 3, "hello!", "...and bye!","opppppps"]
array.pop #=> "opppppps"
array #=> [1, 2, 3, "hello!", "...and bye!"]

[1,5,6,7,10].take(3) #=> [1, 5, 6]

array = [1, 2, 3, "hello!", "...and bye!"]
array.push("item")
#=> [1, 2, 3, "hello!", "...and bye!", "item"]

array = [1,2,3,4,5]
array.insert(0,100) #=> [100, 1, 2, 3, 4, 5]
array.insert(0, 1, 1, 13) #=> [1, 1, 13, 100, 1, 2, 3, 4, 5]

#!!!
#a = [1,2,3,4,5]
#a.unshif("a", "b", "c")
#a.unshift("a", "b", "c") #=> ["a", "b", "c", 1, 2, 3, 4, 5]
#a #=> ["a", "b", "c", 1, 2, 3, 4, 5]

[1,2,3,4].length #=> 4
[1,2,3,4].size #=> 4
array = []
array [1] = 1
array.size #=> 2
array.length #=> 2

array = [1,2,3,4,5,6,7,1,1,2,3]

array.count #=> 11
array.count(1) #=> 3
array.count(2) #=> 2
array.count{|elem| elem.even?} #=> 4
array.count{|elem| elem >= 5 } #=> 3

array = [4, 5, 7, 8, 1, 5, 3]
array.sort #=> [1, 3, 4, 5, 5, 7, 8]
array #=> [4, 5, 7, 8, 1, 5, 3]
array.sort! #=> [1, 3, 4, 5, 5, 7, 8]
array #=> [1, 3, 4, 5, 5, 7, 8]

["a", "b", "e", "d", "c"].sort #=> ["a", "b", "c", "d", "e"]
#["a", "b", "e", "d", "c", 1, 4, 2, 3].sort #=> ArgumentError: comparison of String with 3 failed

array = [ [1,5], [1,3,4] , [2,5,6] , [1,2] , [12,6,8] , [1,7] , [1,2,3], [1,1,2] ]
array.sort! #=> [[1, 1, 2], [1, 2], [1, 2, 3], [1, 3, 4], [1, 5], [1, 7], [2, 5, 6], [12, 6, 8]]

#!!!
#array = [1,6,7,9,2,3,7,4]
#array.sort{|a,b|ab} #=> [1, 2, 3, 4, 6, 7, 7, 9]
#array.sort{|a,b|ba} #=> [9, 7, 7, 6, 4, 3, 2, 1]

[1,-6,2,-4,3].sort_by{|a| a} #=> [-6, -4, 1, 2, 3]
[1,-6,2,-4,3].sort_by{|a| a**2} #=> [1, 2, 3, -4, -6]

['New York','Atlanta', 'Washington', 'Detroit'].sort_by{|string| string.length}
#=> ["Detroit", "Atlanta", "New York", "Washington"]

a =[1,2,3] #=> [1, 2, 3]
a.reverse #=> [3, 2, 1]
a #=> [1, 2, 3]
a.reverse! #=> [3, 2, 1]
a #=> [3, 2, 1] 

5.times {|i| print i, ", "} #0, 1, 2, 3, 4,  => 5 
5.upto(10) { |i| print "#{i} " } #=> 5 6 7 8 9

a = [1,2,3,4,5]
h = {}
a.each{|value| h[value] = value**2} #=> [1, 2, 3, 4, 5]
h #=> {1=>1, 2=>4, 3=>9, 4=>16, 5=>25}


1.step(20,2){|x| print x,", "} #1, 3, 5, 7, 9, 11, 13, 15, 17, 19,  => 1
1.step(by: 2, to: 20){|x| print x,", "} #1, 3, 5, 7, 9, 11, 13, 15, 17, 19,  => 1

p '\nEnd programm'
