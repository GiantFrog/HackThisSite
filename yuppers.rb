def validkey key
	counter = total = 0
	key.each_char do |char|
		total += char.ord + total*counter
		counter += 1
	end
	if total > 925559
		if total >= 927901
			raise 'No possible combos found.'
		else
			puts total
			return true
		end
	else #not big enough
		return false
	end
end

def increment stringy	#this thing actually sucks
	lastChar = stringy.slice! -1
	case lastChar
	when '9'
		lastChar = 'A'
	when 'Z'
		lastChar = 'a'
	when 'z'
		stringy += 'z'
		lastChar = '0'
	else
		lastChar = (lastChar.ord + 1).chr
	end
	stringy += lastChar
	return stringy
end

toTry = String.new 'isadmin'
begin
	until validkey(toTry) == true
		toTry = increment toTry
	end
rescue Exception => e
	puts e
end
puts toTry