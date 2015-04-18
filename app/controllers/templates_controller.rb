class TemplatesController < ApplicationController
	layout :resolve_layout
	before_action :authenticate_user!

  def editor
  	
  	@user = current_user

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
  	template = Template.find(params[:id])
  	user = current_user

  	if params[:commit] == "Update"
  		template.update_attributes(template_params)
  		redirect_to :back
  	elsif params[:commit] == "Update and Select"
  		template.update_attributes(template_params)
  		user.update_attributes(:loginpage => "#{template.id}")
  		redirect_to :back
  	end
  end

  def template_params
  	template = Template.find(params[:id])

  	case template.type
  	when "LoginOne"
		  params.require(:login_one).permit(:title, :backgroundurl)
		when "LoginTwo"
			params.require(:login_two).permit(:title, :backgroundurl)
		when "LoginThree"
			params.require(:login_three).permit(:title, :backgroundurl)
		end

	end

  def show
  	@template = Template.find(params[:id])
    @user = User.find(@template.user_id)
  end


  private

  def resolve_layout
    case action_name
    when "editor"
      false
    when "show"
    	false
    end
  end

end
