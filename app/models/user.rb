class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, authentication_keys: [:login]

  attr_writer :login


  def generate_temporary_authentication_token
    # self.authentication_token = Devise.friendly_token
    token = Devise.friendly_token
    tokens = (self.tokens || []).push(token)
    self.update(tokens: tokens)
    return token
  end

  def clear_temporary_authentication_token
    self.authentication_token = nil
    self.save
  end

  def admin?
  	array = ["farhanmshaikh1@gmail.com", "rockystorm@gmail.com"]
  	bool = false
  	array.each do |a|
	  	if self.email.include? a
	  		return true
	  	else
	  	end
  	end
  	return bool
  end

  def User.is_admin? (user)
    if !user.present?
      bool = false
    else
      array = ["farhanmshaikh1@gmail.com", "rockystorm@gmail.com"]
      bool = false
      array.each do |a|
        if user.email.include? a
          return true
        else
        end
      end
    end
    return bool
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
