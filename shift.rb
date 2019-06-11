require 'net/http'
require 'cgi'

uri = URI 'https://www.hackthissite.org/missions/prog/11/'
http = Net::HTTP.new uri.host, 80
request = Net::HTTP::Get.new uri.request_uri
cookie = CGI::Cookie.new 'PHPSESSID', 'sp9jlqr1k6cqf93h4i7362j0n3'
request['Cookie'] = cookie.to_s
page = http.request(request)

mysteryString = /(\d{1,3}\W){5,}/.match(page.body).to_s
numStrings = (mysteryString.split /\W/)
shift = /Shift: -?\d+/.match(page.body).to_s
shift.slice! 'Shift: '

result = ''
numStrings.each do |numString|
	num = numString.to_i
	result += (num - shift.to_s.to_i).chr
end
puts result
#response = Net::HTTP.post_form uri, 'solution' => result, 'submitbutton' => 'SUBMIT'
#puts response.body