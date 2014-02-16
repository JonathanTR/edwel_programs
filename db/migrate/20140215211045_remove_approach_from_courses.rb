class RemoveApproachFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :approach
  end
end
