class AuthenticationsController < ApplicationController

  def new
  end	

  def index
  	@authentication = Authentication.find_by_uid(session[:provider_userid])
  end	

  def create
   #render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"   	
    @auth = request.env["omniauth.auth"]
    logger.info "========@auth======#{@auth.to_yaml.inspect}"
    logger.info "========extra======#{@auth['extra'].to_yaml.inspect}"
    logger.info "========raw info======#{@auth['extra']['raw_info'].to_yaml.inspect}"
    session[:access_token] = @auth["credentials"]["token"]# if @auth['provider'] == 'facebook'
    provider_user_id = get_provider_user_id(@auth)
    session[:provider_userid] = provider_user_id# if @auth['provider'] == 'facebook'
    provider = @auth['provider']
    session[:provider] = provider
    @authentication = Authentication.find_or_create_by_provider_and_uid(provider, provider_user_id)
  	if @authentication
  	  flash[:notice] = "Signed in successfully."
      redirect_to articles_path
    end
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