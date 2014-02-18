class AddImageToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :image, :string
  end
end
