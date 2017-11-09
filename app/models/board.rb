class Board < ApplicationRecord
  belongs_to :channel
  has_many :posts

  def self.search(search)
    where("name ILIKE ?","%#{search}%")
  end

end
