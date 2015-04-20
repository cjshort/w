class User < ActiveRecord::Base
	has_many :humans
	has_many :human_logins
	has_many :templates
	has_many :schedules

	mount_uploader :logourl, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
