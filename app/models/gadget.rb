class Gadget < ActiveRecord::Base
  belongs_to :user
  has_many :gadget_images

  validates_presence_of :name, :description, :user_id, :thumbnail

  has_attached_file :thumbnail, :styles => { :small => "32x32>", :cover => "256x256" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
