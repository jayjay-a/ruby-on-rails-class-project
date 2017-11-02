class Channel < ApplicationRecord
  has_many :boards
  has_many :channel_groups
  has_many :groups, :through => :channel_groups
end
