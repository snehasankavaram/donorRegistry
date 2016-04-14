desc "Send twilio text reminders to those who have items to donate today."
task :send_reminders => :environment do

	# For now we will only deal with pacific time.

	today = Time.now.strftime("%B %d, %Y")

	def sendReminder (pledges, number)
		# org name
		# address
		# list of what you donated?
		for pledge in pledges
			puts "Sending Message"
			org = nil

			if pledge.org_id != nil
				org = Organization.find(pledge.org_id)
			end

			org_name = org != nil ? org.name : ""

			addr =  org != nil ? org.address + ", " + org.address_line_2 : ""

			item = pledge.quantity.to_s + " " + pledge.item_name

			message_body = "Hello! This is a reminder that you signed up to donate "+ item + " today to " + addr + " for " + org_name + ".  If you are not able to do so, please edit your pledge"

			#send message to donor
			uri = 'https://donormanage-donormanage.c9users.io/sms'
			#+14082210827
			client = HTTPClient.new

			# For now we will only use this within the US.
			number = "+1" + number

			puts "number"

			body = { 'number' => number, 'message' => message_body}
			res = client.post(uri, body)

		end
	end


	for user in User.all
		for pledge in user.pledges
			pledges_today = []
			puts "Date"
			puts pledge.delivery_date.strftime("%B %d, %Y")
			puts "Today"
			puts today
			puts " "

			if pledge.delivery_date.strftime("%B %d, %Y") == today
				pledges_today << pledge
			end
		end
		if pledges_today != nil and pledges_today != []
			sendReminder(pledges_today, user.phone_number)
		end
	end
	puts "Finished Script"

end


