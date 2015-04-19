namespace :deploy do

	desc 'Precompile assets for production'		
	task :precompile do 		
		puts '  --> Precompile in process......'		
		stdout = %x{RAILS_ENV=production bundle exec rake assets:precompile}		
	end		
	
end