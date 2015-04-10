class TemplatesController < ApplicationController
	layout 'templateeditor'
	before_action :authenticate_user!

  def editor
  	case params[:type]
  	when "LoginOne"
  		@template = current_user.templates.where(:type => 'LoginOne').last
  	when "LoginTwo"
  		@template = current_user.templates.where(:type => 'LoginTwo').last
  	when "LoginThree"
  		@template = current_user.templates.where(:type => 'LoginThree').last
		end
  end

  def update
  end

  def updateselect
  end

  def show
  end

end
