class AuthenticationsController < ApplicationController

  def new
  end	

  def index
  	@authentication = Authentication.find_by_uid(session[:provider_userid])
  end	

  def create
   render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"   	
   #  @auth = request.env["omniauth.auth"]
   #  session[:access_token] = @auth["credentials"]["token"]# if @auth['provider'] == 'facebook'
   #  session[:provider_userid] = @auth['uid']# if @auth['provider'] == 'facebook'
   #  session[:provider] = @auth['provider']
   #  @authentication = Authentication.find_or_create_by_provider_and_uid(@auth['provider'], @auth['uid'])
  	# if @authentication
  	#   flash[:notice] = "Signed in successfully."
   #    redirect_to articles_path
   #  end
  end

  def destroy
  	@authentication = Authentication.find_by_uid(session[:provider_userid])
  	@authentication.destroy if @authentication
  	flash[:notice] = "Logged out successfully"
    #redirect_to "https://www.facebook.com/logout.php?next=#{new_authentication_url}&access_token=#{session[:access_token]}"
    redirect_to "https://www.github.com/logout?access_token=#{session[:access_token]}"
    #redirect_to "https://www.facebook.com/logout.php?access_token=#{session[:access_token]}"
    #redirect_to new_authentication_url
  end

  def facebook_logout
    redirect_to new_authentication_url
  end

end