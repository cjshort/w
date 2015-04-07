class Humans::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    
    user = request.env['omniauth.params']['var'] # Passing user ID through callback

    # You need to implement the method below in your model (e.g. app/models/human.rb)
    @human = Human.find_for_facebook_oauth(request.env["omniauth.auth"], current_human, user)
 
    if @human.persisted?
      sign_in @human, :event => :authentication #this will throw if @human is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      HumanLogin.create(:user_agent => request.user_agent, :ip => request.remote_ip, :human_id => current_human.id, :user_id => user)
      redirect_to public_redirect_path(user)
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to :back
    end
  end

  def twitter

    user = request.env['omniauth.params']['var']
    auth = env["omniauth.auth"]

    #Rails.logger.info("auth is **************** #{auth.to_yaml}")

    @human = Human.find_for_twitter_oauth(request.env["omniauth.auth"], current_human, user)
    if @human.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in @human, :event => :authentication
      HumanLogin.create(:user_agent => request.user_agent, :ip => request.remote_ip, :human_id => current_human.id, :user_id => user)
      redirect_to public_redirect_path(user)
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to :back
    end
  end

  def linkedin

    auth = env["omniauth.auth"]
    user = request.env['omniauth.params']['var']

    @human = Human.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user, user)

    if @human.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in @human, :event => :authentication
      HumanLogin.create(:user_agent => request.user_agent, :ip => request.remote_ip, :human_id => current_human.id, :user_id => user)
      redirect_to public_redirect_path(user)
    else
      session["devise.linkedin_uid"] = request.env["omniauth.auth"]
      redirect_to :back
    end
  end

end