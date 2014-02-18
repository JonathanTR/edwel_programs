class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.text :bio
      t.belongs_to :course
      t.timestamps
    end
  end
end
