class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include SessionsHelper
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user = User.from_omniauth(request.env["omniauth.auth"])
    log_in user
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end