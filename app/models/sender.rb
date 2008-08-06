class Sender < ActionMailer::Base

	def send_to_friend(reffer)
		# Email header info MUST be added here
		recipients "bsloser@gmail.com"
		from  "sloser@emusoft.org"
		subject "Url from friend"

		body :reffer => reffer
end  

end
