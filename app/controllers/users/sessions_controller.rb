# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  skip_before_action :verify_signed_out_user
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if request.format.json? 

      user = User.find_by(email: params[:login]) || User.find_by(username: params[:login])

      if user.present? && user.valid_password?(params[:password])
        generated_token = user.generate_temporary_authentication_token
        render json: user.attributes.merge(:admin => user.admin?, generated_token: generated_token)
        # user.generate_temporary_authentication_token
        # render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
      else
        head(:unauthorized)
      end
    else
      super
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if request.format.json? 
      if request.headers['X-User-Token'].present?
        user = User.find_by(email: request.headers['X-User-Email'])
        token = request.headers['X-User-Token']
        user.update(tokens: user.tokens - [token])
        render json: user.tokens
      end
    else
      super
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
