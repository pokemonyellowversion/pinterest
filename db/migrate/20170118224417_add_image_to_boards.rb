class AddImageToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :image_file_name, :string
    add_column :boards, :image_content_type, :string
    add_column :boards, :image_file_size, :integer
    add_column :boards, :image_updated_at, :datetime
  end
end
