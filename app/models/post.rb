class Post < ApplicationRecord
  belongs_to :board
  has_many :post_histories
  has_many :users, :through => :post_histories
end
