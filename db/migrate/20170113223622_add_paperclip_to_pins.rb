class AddPaperclipToPins < ActiveRecord::Migration
  def change
  	add_attachment :pins, :image
  end

end
