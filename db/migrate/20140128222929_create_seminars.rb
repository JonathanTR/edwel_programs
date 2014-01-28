class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.belongs_to :course
    end
  end
end
