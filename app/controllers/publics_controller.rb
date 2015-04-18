class PublicsController < ApplicationController
	layout false
	
  def login
  	@user = User.find(params[:id])
  	@template = User.find(params[:id]).templates.find(@user.loginpage)
  end

  def redirect
  	@user = User.find(params[:id])
  end
end
