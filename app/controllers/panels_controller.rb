class PanelsController < ApplicationController
	layout "panel"
	before_action :authenticate_user!

  def dashboard
  end

  def humans
  end
end
