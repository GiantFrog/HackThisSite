require 'digest'

def evalCrossTotal(strMD5)			#add the hex value represented by each character in the md5 together
	intTotal = 0
	arrMD5Chars = strMD5.split // #matches after every one char
	arrMD5Chars.each do |value|
		intTotal += value.hex				#add the hex number to total
	end
	return intTotal
end

def encryptString(strString, strPassword)
	#strString is the content of the entire file with serials
	strPasswordMD5 = Digest::MD5.hexdigest strPassword		#md5 password
	intMD5Total = evalCrossTotal(strPasswordMD5)					#add md5 together
	arrEncryptedValues = Array.new
	intStrlen = strString.length
	for i in 0...intStrlen																#from 0 to unencrypted string's length - 1
		arrEncryptedValues[i] = strString[i].ord + strPasswordMD5[i%32].hex - intMD5Total		#char's ascii + corresponding password hash char's hex value - all hash chars' hex values
		ba = Digest::MD5.hexdigest(strString[0..i])[0...16]																	#md5 hash the first part of the sting (to i) and take the first 16 chars
		g =  Digest::MD5.hexdigest(intMD5Total.to_s)[0...16]																#md5 hash the previus sum and take the first 16 chars
		intMD5Total = evalCrossTotal(ba+g)																									#concat the two and add their hexes together
	end

	return arrEncryptedValues.join ' '
end

def decryptString(strEncryptedValues, strPassword)
	encrypted = (strEncryptedValues.split ' ').map &:to_i		#make an array of the encypted ints
	for a in 0..480 do		#each possible evalCrossTotal
		decrypted = Array.new
		decrypted[0] = encrypted[0] - '0-f' + a
		for b in 1..encrypted.length do
			decrypted[b] = encrypted[b] - '0-f' + (Digest::MD5.hexdigest(encrypted[0..b-1])[0...16] << Digest::MD5.hexdigest(a.to_s)[0...16])
			decrypted[3] = '-' #make sure to check that the formula gives us a '-'; otherwise, start a new run
		end
	end
end

file =
		<<-FILE
		99Z-KH5-OEM-240-1.1
		QGG-V33-OEM-0B1-1.1
		Z93-Z29-OEM-BNX-1.1
		IQ0-PZI-OEM-PK0-1.1
		UM4-VDL-OEM-B9O-1.1
		L0S-4R2-OEM-UQL-1.1
		JBL-EYQ-OEM-ABB-1.1
		NL1-3V3-OEM-L4C-1.1
		7CQ-1ZR-OEM-U3I-1.1
		XX0-IHL-OEM-5XK-1.1
		KJQ-RXG-OEM-TW8-1.1
		OZR-LW1-OEM-5EM-1.1
		0B8-6K5-OEM-EFN-1.1
		OE2-20L-OEM-SSI-1.1
		0ME-HAE-OEM-9XB-1.1
		FILE
puts encryptString file, 'jam'
decryptString "12 -1 -1 -534", 't'