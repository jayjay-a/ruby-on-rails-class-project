class User < ApplicationRecord
  has_many :post_histories
  has_many :posts, :through => :post_histories
  has_many :user_statuses
  has_many :user_roles
  has_many :user_groups
  has_many :groups, :through => :user_groups
end
