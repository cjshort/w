class HumansController < ApplicationController
	layout 'panel'

  def profile
  	@human = Human.find(params[:id])
  	@latest = Human.all.order('created_at DESC').limit(10)
  	@lastvisits = Human.find(params[:id]).human_logins.order('created_at DESC').limit(5)
  	@lastvisit = Human.find(params[:id]).human_logins.last
  end
end
