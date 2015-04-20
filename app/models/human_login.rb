class HumanLogin < ActiveRecord::Base
	belongs_to :human, counter_cache: true
	belongs_to :user

end
