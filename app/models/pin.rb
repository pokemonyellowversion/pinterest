class Pin < ActiveRecord::Base
  belongs_to :board

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  after_create :fix_url
    
  def fix_url
  	self.image.url.split("/").reject { |c| c.empty? }.join("/")
  end
end
