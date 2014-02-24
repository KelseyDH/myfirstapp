require "pony"


class EmailSender

	def initialize(name, email, message)

		@email = email
		@name = name
		@message = message
	end

	def send


		Pony.mail(  :to => "kelseyh@gmail.com",
					:from => @email,
					:subject => "Hi! You got a message from #{@name}",
					:body =>"Email from: #{@email}" + @message,
		    		:via => :smtp,
 					:via_options => {
    				:address              => 'smtp.gmail.com',
				    :port                 => '587',
				    :enable_starttls_auto => true,
				    :user_name            => 'answerawesome',
				    :password             => 'Sup3r$ecret',
				    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
				    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
				    })


	end


end