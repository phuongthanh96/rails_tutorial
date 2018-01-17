class Post < ApplicationRecord
	belongs_to :creator, 
	class_name: User.name,foreign_key: :user_id

	has_many :comments
	
	self.per_page=5
	mount_uploader :image_url, PictureUploader
end
