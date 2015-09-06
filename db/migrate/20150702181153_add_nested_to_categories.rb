class AddNestedToCategories < ActiveRecord::Migration
  def self.up
  	Category.where(parent_id: 0).update_all(parent_id: nil)
    add_column :categories, :lft,       :integer
    add_column :categories, :rgt,       :integer

    # optional fields
    add_column :categories, :depth,          :integer
    add_column :categories, :children_count, :integer

    # This is necessary to update :lft and :rgt columns
    Category.rebuild!
  end

  def self.down
    remove_column :categories, :lft
    remove_column :categories, :rgt

    # optional fields
    remove_column :categories, :depth
    remove_column :categories, :children_count
  end
end
