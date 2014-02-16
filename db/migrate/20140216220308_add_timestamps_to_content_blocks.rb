class AddTimestampsToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :created_at, :datetime
    add_column :content_blocks, :updated_at, :datetime
  end
end
