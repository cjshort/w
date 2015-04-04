class HumansController < ApplicationController
	layout 'panel'

  def profile
  	human = Human.find(params[:id])

  	@human = human
  	@latest = Human.all.order('created_at DESC').limit(10)
  	@lastvisits = human.human_logins.order('created_at DESC').limit(5)
  	@lastvisit = human.human_logins.last
  	@visits = human.human_logins.count

  	@fivemonths = human.human_logins.all.where("created_at = ?", 5.months.ago).count
  	@fourmonths = human.human_logins.all.where("created_at = ?", 4.months.ago).count
  	@threemonths = human.human_logins.all.where("created_at = ?", 3.months.ago).count
  	@twomonths = human.human_logins.all.where("created_at = ?", 2.months.ago).count
  	@onemonths = human.human_logins.all.where("created_at = ?", 1.months.ago).count
  	@zeromonths =  human.human_logins.all.where("created_at BETWEEN ? AND ?", Time.now.beginning_of_month, Time.now.end_of_month).count
  	# Postgres should be: eated_at > ? AND < ?", Time.now.beginning_of_month, Time.now.end_of_month)
  end
end
