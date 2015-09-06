namespace :newsline do
	desc "rebuild for categories"
	task :rebuild_categories => :environment do
		puts('rebuild categories') if Category.rebuild!
	end
end