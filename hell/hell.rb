puts 'Give me a puzzle!'
sudoku = Array.new
pasta = '2,,4,,,,1,9,,5,6,7,8,,1,,,2,,,1,2,3,4,7,,5,1,2,,4,,6,,8,7,4,,6,7,,,,2,1,,8,9,1,2,3,,5,4,,4,5,6,7,,2,1,9,6,7,8,,1,2,,4,3,9,1,,3,4,5,,,'.split ','

pasta.each_slice 9 do |row|
	sudoku << row
end
puts sudoku