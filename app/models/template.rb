class Template < ActiveRecord::Base
	belongs_to :user
	mount_uploader :backgroundurl, ImageUploader
end