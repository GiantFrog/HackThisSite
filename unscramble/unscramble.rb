wordlist = File.open('wordlist.txt', encoding: 'utf-8')
words = Array.new
unscramble = Array.new
letterCounts = Hash.new
scrambleCounts = Hash.new

unless wordlist.eof?
	wordlist.each_line do |line|
		words << line.chomp
	end
end
wordlist.close
puts 'wordlist loaded!'

wordlist = File.open('unscramble.txt', encoding: 'utf-8')

unless wordlist.eof?
	wordlist.each do |line|
		unscramble << line.chomp
	end
end
wordlist.close
puts 'scrambled words loaded!'

words.each do |word|
	letterCounts[word] = Hash.new(0)

	word.each_char do |letter|
		letterCounts[word][letter] += 1
	end
end
puts 'letters counted!'

unscramble.each do |scramble|
	scrambleCounts[scramble] = Hash.new(0)

	scramble.each_char do |letter|
		scrambleCounts[scramble][letter] += 1
	end

	letterCounts.each do |count|
		if count[1] == scrambleCounts[scramble]
			print count[0]
			print ','
		end
	end
end