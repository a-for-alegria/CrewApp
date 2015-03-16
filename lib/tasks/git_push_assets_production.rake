namespace :deploy do

  desc 'Add files via git'
	task :add do 
		puts '  --> Adding untracked/deleted files'
		stdout = %x{git add --all}
		puts '  --> Complete'
	end

	desc 'Provide commit with message'
	task :commit_message do 
		puts '  --> Describe content'
		message = STDIN.gets
		stdout = %x{git commit -m "#{message}"}
	end

	desc 'Push changes to dev repository'
	task :push do 
		puts '  --> Uploading to repository......'
		stdout = %x{git push}
	end

  desc 'Precompile assets for production'
	task :precompile do 
		puts '  --> Precompile in process......'
		stdout = %x{RAILS_ENV=production bundle exec rake assets:precompile}
	end

	desc 'Deploy to Heroku'
	task :deploy_heroku do 
		puts '  --> Deploying to Heroku......'
		stdout = %x{git push heroku master}
	end

	desc 'Launch deploy process'
	task start: [:add, :commit_message, :push, :precompile, :deploy_heroku] do 
		puts '  --> Complete!'
	end
end