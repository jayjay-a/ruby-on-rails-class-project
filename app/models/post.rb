class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :post_histories
 
  def self.search(search)
    where("name LIKE ? OR message LIKE ?", "%#{search}%", "%#{search}%")
  end
end