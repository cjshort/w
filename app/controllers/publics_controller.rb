class PublicsController < ApplicationController
	layout false
	
  def login
  	@user = User.find(params[:id])
  end

  def redirect
  end
end
