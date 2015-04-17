namespace :deploy do
	desc 'Deploy to Heroku'
	task :heroku do 
		puts '  --> Deploying to Heroku......'
		puts '------> Which branch do you wanna use?'
		branch = STDIN.gets.chomp
		stdout = %x{git push heroku #{branch}}
	end

	desc 'Launch deploy process'
	task start: [] do 
		puts '  --> Complete!'
	end
end