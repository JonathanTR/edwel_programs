class AddStyleToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :style, :string
  end
end
