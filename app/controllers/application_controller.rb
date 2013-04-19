class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :logged_in_user

  def get_provider_user_id(auth)
  	case auth['provider']
  	when 'facebook'
  	  auth['uid']
  	when 'github'	
	  auth['extra']['raw_info']['login']
	end  
  end

  private
  def logged_in_user
  	user_id = session[:provider_userid]
  	provider = session[:provider]
  	@authentication = Authentication.find_by_provider_and_uid(provider, user_id) if (user_id && provider)
  end	
end
