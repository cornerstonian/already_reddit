class Comment < ActiveRecord::Base
  belongs_to :post
  validates :post, :user, :body, presence: true

end
