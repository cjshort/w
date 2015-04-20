class PanelsController < ApplicationController
	layout "panel"
	before_action :authenticate_user!

  def dashboard
  	@latest = Human.all.order('created_at DESC').limit(10)
  end

  def leaderboardfilter
  	@latest = Human.all.order('created_at DESC').limit(10)
	  case params[:filter]
	  	when 'name'
	  		case params[:order]
		  		when 'asc'
				  	@human = Human.all.order('fullname ASC')
				  when 'desc'
				  	@human = Human.all.order('fullname DESC')
			  end
		  when 'email'
	  		case params[:order]
		  		when 'asc'
				  	@human = Human.all.order('email ASC')
				  when 'desc'
				  	@human = Human.all.order('email DESC')
			  end
		  when 'visits'
	  		case params[:order]
		  		when 'asc'
				  	@human = Human.all.order("human_logins_count ASC")
				  when 'desc'
				  	@human = Human.all.order("human_logins_count DESC")
			  end
		  when 'firstvisit'
	  		case params[:order]
		  		when 'asc'
				  	@human = Human.all.order('created_at ASC') 
				  when 'desc'
				  	@human = Human.all.order('created_at DESC')
			  end
		  else
		  	redirect_to panels_leaderboard_path
	  end
  end

  def loginpage
  end

  def welcomepage
  end

  def emailblast
  	@option1 = current_user.humans.count.to_s
  	@blast = Blast.new
  end

  def emailblastcreate
  	email = Blast.create(blast_params)
  	user = current_user
  	if email.save
	  	PanelMailer.blast(user, email).deliver
	  end
  end

  def blast_params
  	params.require(:blast).permit(:to, :subject, :body)
  end

  def emailschedule
  end

  def settings
  	@user = current_user
  end

  def settingsupdate
  	current_user.update_attributes(user_params)
  	redirect_to panels_settings_path
  end

  def user_params
  	params.require(:user).permit(:logourl, :bghex, :mailer, :firstname, :lastname, :address1, :address2, :region, :postcode, :country)
	end


end
