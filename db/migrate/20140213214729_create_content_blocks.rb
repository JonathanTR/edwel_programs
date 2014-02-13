class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.belongs_to :course
      t.text :content
    end
  end
end
