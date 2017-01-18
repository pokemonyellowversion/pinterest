class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true

	has_many :boards, dependent: :destroy

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
