class TemplatesController < ApplicationController
	layout :resolve_layout
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
  	@user = current_user
  	@template = Template.find(params[:id])
  end


  private

  def resolve_layout
    case action_name
    when "editor"
      "templateeditor"
    when "show"
    	false
    end
  end

end
