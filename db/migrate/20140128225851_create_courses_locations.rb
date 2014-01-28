class CreateCoursesLocations < ActiveRecord::Migration
  def change
    create_table :courses_locations do |t|
      t.belongs_to :location
      t.belongs_to :course
    end
  end
end
