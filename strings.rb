require 'net/http'
require 'cgi/cookie'

uri = URI 'https://www.hackthissite.org/missions/prog/12/'
http = Net::HTTP.new uri.host, 80
request = Net::HTTP::Get.new uri.request_uri
cookie = CGI::Cookie.new 'PHPSESSID', 'sp9jlqr1k6cqf93h4i7362j0n3'
request['Cookie'] = cookie.to_s
page = http.request(request)

stringy = /<b>String: <\/b><input type="text" value=".+"/.match(page.body).to_s
stringy.slice! '<b>String: </b><input type="text" value="'
stringy.chop!

primes = Array.new
comps = Array.new
newString = ''
finalString = ''
primeSum = compSum = 0

stringy.each_char do |char|
		case char
		when '0', '1'
			#ignore 0s and 1s
		when '2', '3', '5', '7'
			primes << char.to_s.to_i
		when '4', '6', '8', '9'
			comps << char.to_s.to_i
		else
			unless newString.length >= 25
				newString += char
			end
		end
end

primes.each do |prime|
	primeSum += prime
end
comps.each do |comp|
	compSum += comp
end

newString.each_char do |char|
	finalString += (char.ord + 1).chr
end
finalString += (primeSum*compSum).to_s
puts finalString