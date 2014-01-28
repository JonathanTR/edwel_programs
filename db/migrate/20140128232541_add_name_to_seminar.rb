class AddNameToSeminar < ActiveRecord::Migration
  def change
    add_column :seminars, :name, :string
  end
end
