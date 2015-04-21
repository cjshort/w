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
    case email.to
    when 1
      to_map = user.humans.where(provider: ["linkedin", "facebook"]).map { |human| { email: human.email, name: human.fullname }}
    when 2
      to_map = { email: user.email, name: user.firstname }
    end
  	user = current_user
  	if email.save && to_map <= user.mailcount
	  	PanelMailer.blast(user, email, to_map).deliver
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
