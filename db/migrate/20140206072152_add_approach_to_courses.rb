class AddApproachToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :approach, :text
  end
end
