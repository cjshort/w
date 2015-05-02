class HumansController < ApplicationController
	layout 'panel'
  before_action :authenticate_user!

  def profile
  	human = Human.find(params[:id])

    @rank = Human.all.order('human_logins_count DESC').index(human) + 1
  	@human = human
  	@latest = Human.all.order('created_at DESC').limit(10)
  	@lastvisits = human.human_logins.order('created_at DESC').limit(5)
  	@lastvisit = human.human_logins.last
  	@visits = human.human_logins.count

  	@fivemonths = human.human_logins.all.where("created_at BETWEEN ? AND ?", 5.months.ago.time.beginning_of_month, 5.months.ago.time.end_of_month).count
  	@fourmonths = human.human_logins.all.where("created_at BETWEEN ? AND ?", 4.months.ago.time.beginning_of_month, 4.months.ago.time.end_of_month).count
  	@threemonths = human.human_logins.all.where("created_at BETWEEN ? AND ?", 3.months.ago.time.beginning_of_month, 3.months.ago.time.end_of_month).count
  	@twomonths = human.human_logins.all.where("created_at BETWEEN ? AND ?", 2.months.ago.time.beginning_of_month, 2.months.ago.time.end_of_month).count
  	@onemonths = human.human_logins.all.where("created_at BETWEEN ? AND ?", 1.months.ago.time.beginning_of_month, 1.months.ago.time.end_of_month).count
  	@zeromonths =  human.human_logins.all.where("created_at BETWEEN ? AND ?", Time.now.beginning_of_month, Time.now.end_of_month).count
  	# Postgres should be: eated_at > ? AND < ?", Time.now.beginning_of_month, Time.now.end_of_month)
  end
end
