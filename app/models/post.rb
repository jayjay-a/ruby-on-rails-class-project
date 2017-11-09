class Post < ApplicationRecord
  belongs_to :board
  has_many :post_histories
  has_many :users, :through => :post_histories

  def self.search(search)
    where("name LIKE ? OR message LIKE ?", "%#{search}%", "%#{search}%")
  end
end
