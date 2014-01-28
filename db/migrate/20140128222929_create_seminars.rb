class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.belongs_to :location
    end
  end
end
