def try_decryption encrypted, passNum
	message = ''

	begin
		encrypted.each_slice 3 do |triplet|
			sum = triplet[0].to_i + triplet[1].to_i + triplet[2].to_i
			ascii = sum - passNum
			message += ascii.chr
		end
	rescue
		return nil
	end
	return message
end

encryptedFile = File.open('xecrypted_text.txt', encoding: 'utf-8')
encrypted = Array.new

unless encryptedFile.eof?
	encryptedFile.each_line do |line|
		encrypted += line.chomp.split('.')
	end
end
encrypted.slice! 0	#remove first blank array entry

for a in 0..2000
	potential = try_decryption encrypted, a
	unless potential == nil
		puts 'Possible passcode: ' + a.to_s
		puts potential
	end
end