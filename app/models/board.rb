class Board < ActiveRecord::Base
	belongs_to :user

	has_many :pins, dependent: :destroy

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	before_validation { image.clear if @delete_image }

	 def delete_image
	   @delete_image ||= false
	 end

	 def delete_image=(value)
	   @delete_image  = !value.to_i.zero?
	 end
end
