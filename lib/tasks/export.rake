namespace :export do
	desc "Prints all objects in a seeds.rb way."
	task :seeds_format => :environment do
		Category.order(:parent_id).all.each do |category|
			parent_id = category.parent_id.present? ? "Category.find_by_name('#{category.parent.name}').id" : 'nil'
			puts "Category.create(name:'#{category.name}', parent_id: #{parent_id})"
		end
		
		Event.order(:id).all.each do |event|
			puts "Event.create('name'=>'#{event.name}',#{event.serializable_hash(only: :description).to_s.gsub(/[{}]/,'')},'event_date'=>'#{event.event_date}','category_id'=>Category.find_by_name('#{event.category.name}').id)"
		end
		
		User.order(:id).all.each do |user|
			puts "User.create('email'=>'#{user.email}','firstname'=>'#{user.firstname}','lastname'=>'#{user.lastname}','admin'=>#{user.admin},'password'=>'s1234567890s')"
		end
		
		Event.order(:id).all.each do |event|
			event_users_collect = event.users.collect{|user| user.email}
			puts "Event.find_by_name('#{event.name}').users = User.where('email in (?)', #{event_users_collect})" unless event_users_collect.empty?
		end
	end
end