class HumanLogin < ActiveRecord::Base
	belongs_to :human
	belongs_to :user

end
