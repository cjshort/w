class PublicsController < ApplicationController
	layout false
	
  def login
  	@user = User.find(params[:id])
  	@template = User.find(params[:id]).templates.where(:type => "LoginOne").last
  end

  def redirect
  	@user = User.find(params[:id])
  end
end
