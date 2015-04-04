class PanelsController < ApplicationController
	layout "panel"
	before_action :authenticate_user!

  def dashboard
  	@latest = Human.all.order('created_at DESC').limit(10)
  end

  def humans
  end
end
