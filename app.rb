require "sinatra"
require "rubygems"
require "./emailsender"

	get "/" do
		erb :index, layout: :mainlayout
	end

	get "/contact" do
		erb :contact, layout: :mainlayout
	end


	post "/contact" do
		emailsender = EmailSender.new(params[:name], params[:email], params[:message])
		emailsender.send
		erb :thankyou, layout: :mainlayout
	end

###Get is to render the survey page
	get "/survey" do
		erb :survey, layout: :mainlayout
	end

##### post is for the survey input
	post "/survey" do
		work_best = params[:work_best]
		consider_yourself = params[:consider_yourself]
		interested_in = params[:interested_in]

		if work_best == "with_deadlines" && consider_yourself == "rational" && interested_in == "ideas"
			@personality_type = "Rational"
		elsif work_best == "with_deadlines" && consider_yourself == "rational" && interested_in == "facts"
			@personality_type = "Guardian"
		elsif work_best == "without_deadlines" && consider_yourself == "rational" && interested_in == "ideas"
			@personality_type = "Idealist"
		elsif work_best == "without_deadlines" && consider_yourself == "rational" && interested_in == "facts"
			@personality_type = "Artisan"
		elsif work_best == "with_deadlines" && consider_yourself == "compassionate" && interested_in == "ideas"
			@personality_type = "Idealist"
		elsif work_best == "with_deadlines" && consider_yourself == "compassionate" && interested_in == "facts"
			@personality_type = "Guardian"
		elsif work_best == "without_deadlines" && consider_yourself == "compassionate" && interested_in == "ideas"
			@personality_type = "Idealist"
		else work_best == "without_deadlines" && consider_yourself == "compassionate" && interested_in == "facts"
			@personality_type = "Artisan"
		end


		erb :results
	end


