class AuthenticationsController < ApplicationController

  def new
  end	

  def index
  	@authentication = Authentication.find_by_uid(session[:fb_uid])
  end	

  def create
  	#render :text => request.env['omniauth.auth'].inspect
    @auth = request.env["omniauth.auth"]
    session[:fb_token] = @auth["credentials"]["token"] if @auth['provider'] == 'facebook'
    session[:fb_uid] = @auth['uid'] if @auth['provider'] == 'facebook'
    @authentication = Authentication.find_or_create_by_provider_and_uid(@auth['provider'], @auth['uid'])
  	if @authentication
  	  flash[:notice] = "Signed in successfully."
      redirect_to authentications_url
    end
  end

  def destroy
  	@authentication = Authentication.find_by_uid(session[:fb_uid])
  	@authentication.destroy if @authentication
  	flash[:notice] = "Logged out successfully"
    redirect_to "https://www.facebook.com/logout.php?next=#{new_authentication_url}&access_token=#{session[:fb_token]}"
    #redirect_to "https://www.facebook.com/logout.php?access_token=#{session[:fb_token]}"
    #redirect_to new_authentication_url
  end

  def facebook_logout
    redirect_to new_authentication_url
  end

end