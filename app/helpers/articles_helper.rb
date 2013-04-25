require 'open-uri'

module ArticlesHelper
  def user_photo(provider, user_id)
  	case provider
  	when 'facebook'
  	  #JSON.parse(`curl https://graph.facebook.com/#{user_id}?fields=picture`)['picture']['data']['url']
  	  JSON.parse(open("https://graph.facebook.com/#{user_id}?fields=picture").string)['picture']['data']['url']
  	when 'github'
  	  #JSON.parse(`curl https://api.github.com/users/#{user_id}`)['avatar_url']
  	  JSON.parse(open("https://api.github.com/users/#{user_id}").string)['avatar_url']
  	end
  end
end
