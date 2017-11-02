class Group < ApplicationRecord
  has_many :channel_groups
  has_many :channels, :through => :channel_groups
  has_many :user_groups
  has_many :users, :through => :user_groups

end
