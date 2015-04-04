class Human < ActiveRecord::Base
  has_many :human_logins
	belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

def self.find_for_facebook_oauth(auth, signed_in_resource=nil, user)
  human = Human.where(:provider => auth.provider, :uid => auth.uid).first
  if human
    return human
  else
    registered_human = Human.where(:email => auth.info.email).first
    if registered_human
      return registered_human
    else
      human = Human.create(
                          provider: auth.provider,
                          uid: auth.uid,
                          fullname: auth.extra.raw_info.name,
                          gender: auth.extra.raw_info.gender,
                          agerange: auth.extra.raw_info.age_range,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20],
                          user_id: user
                        )
    end   
  end
end

def self.find_for_twitter_oauth(auth, signed_in_resource=nil, user)
 
  human = Human.where(:provider => auth.provider, :uid => auth.uid).first
  if human
    return human
  else
    registered_human = Human.where(:email => auth.uid + "@twitter.com").first
    if registered_human
      return registered_human
    else
      human = Human.create(
        fullname:auth.info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.uid+"@twitter.com",
        password: Devise.friendly_token[0,20],
        user_id: user,
        location: auth.info.location,
        picture: auth.extra.raw_info.profile_image_url_https
      )
    end
  end
end

def self.connect_to_linkedin(auth, signed_in_resource=nil, user)
  human = Human.where(:provider => auth.provider, :uid => auth.uid).first
  if human
    return human
  else
    registered_human = Human.where(:email => auth.info.email).first
    if registered_human
      return registered_human
    else
      human = Human.create(
                          provider: auth.provider,
                          uid: auth.uid,
                          fullname: auth.info.name,
                          location: auth.info.location,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20],
                          user_id: user
                        )
    end   
  end
end

end
