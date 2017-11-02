class Board < ApplicationRecord
  belongs_to :channel
  has_many :posts
end
