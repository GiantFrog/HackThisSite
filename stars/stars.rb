require 'chunky_png'

def translate letter
	case letter
	when '.-'
		return 'A'
	when '-...'
		return 'B'
	when '-.-.'
		return 'C'
	when '-..'
		return 'D'
	when '.'
		return 'E'
	when '..-.'
		return 'F'
	when '--.'
		return 'G'
	when '....'
		return 'H'
	when '..'
		return 'I'
	when '.---'
		return 'J'
	when '-.-'
		return 'K'
	when '.-..'
		return 'L'
	when '--'
		return 'M'
	when '-.'
		return 'N'
	when '---'
		return 'O'
	when '.--.'
		return 'P'
	when '--.-'
		return 'Q'
	when '.-.'
		return 'R'
	when '...'
		return 'S'
	when '-'
		return 'T'
	when '..-'
		return 'U'
	when '...-'
		return 'V'
	when '.--'
		return 'W'
	when '-..-'
		return 'X'
	when '-.--'
		return 'Y'
	when '--..'
		return 'Z'
	when '-----'
		return '0'
	when '.----'
		return '1'
	when '..---'
		return '2'
	when '...--'
		return '3'
	when '....-'
		return '4'
	when '.....'
		return '5'
	when '-....'
		return '6'
	when '--...'
		return '7'
	when '---..'
		return '8'
	when '----.'
		return '9'
	when '.-.-.-'
		return '.'
	when '--..--'
		return ','
	when '---...'
		return ':'
	when '-.-.-.'
		return ';'
	when '..--..'
		return '?'
	when '.----.'
		return "'"
	when '-....-'
		return '-'
	when '-..-.'
		return '/'
	when '.-..-.'
		return '"'
	when '.--.-.'
		return '@'
	when '-...-'
		return '='
	when '.-.-.'
		return '+'
	when '..--.-'
		return '_'
	when '...-..-'
		return '$'
	else
		puts 'Unknown character found.'
		return ''
	end
end

stars = ChunkyPNG::Image.from_file 'download.png'
lastValue = 0
code = ''
message = ''

for y in 0..stars.height-1
	for x in 0..stars.width-1
		unless stars[x, y] == ChunkyPNG::Color('black')
			code += (stars.width*y + x - lastValue).chr
			lastValue = 100*y + x
		end
	end
end
puts code

letters = code.split
letters.each do |letter|
	message += translate letter
end

puts message