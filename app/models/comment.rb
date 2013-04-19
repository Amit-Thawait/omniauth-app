class Comment < ActiveRecord::Base
  attr_accessible :article_id, :comment, :provider, :user_id

  belongs_to :article
end
