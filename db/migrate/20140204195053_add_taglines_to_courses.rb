class AddTaglinesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :tagline, :string
  end
end
