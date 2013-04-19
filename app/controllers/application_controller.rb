class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in_user

  private
  def logged_in_user
  	user_id = session[:provider_userid]
  	provider = session[:provider]
  	@authentication = Authentication.find_by_provider_and_uid(provider, user_id) if (user_id && provider)
  end	
end
