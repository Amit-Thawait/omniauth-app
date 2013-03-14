class AuthenticationsController < ApplicationController

  def new

  end	

  def index
  	#@authentication = Authentication.first
  end	

  def create
  	#render :text => request.env['omniauth.auth'].inspect
  	@auth = request.env["omniauth.auth"]
  	logger.info "==============auth===========#{@auth.inspect}"
  	@authentication = Authentication.find_or_create_by_provider_and_uid(@auth['provider'], @auth['uid'])
  	logger.info "==============@authentication========#{@authentication.inspect}"
  	if @authentication
  	  flash[:notice] = "Signed in successfully."
      redirect_to authentications_url
    end
  end

  def destroy
  	@authentication = Authentication.find(params[:id])
  	@authentication.destroy if @authentication
  	flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end	

end