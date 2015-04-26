class SchedulesController < ApplicationController
	layout "panel"
	before_action :authenticate_user!

  def edit
  	
  end

  def update
  end

  def create
    user = current_user
  	user.schedules.create(schedule_params)
  end

  def new
  	@schedule = Schedule.new
  end

  def schedule_params
  	params.require(:schedule).permit(:subject, :body, :mode, :value, :status, :name)
  end
end
