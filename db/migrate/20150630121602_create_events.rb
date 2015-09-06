class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string 	 :name
			t.string 	 :description
			t.integer  :category_id
			t.datetime :event_date
			t.timestamps
		end
		add_index :events, :category_id
	end
end
