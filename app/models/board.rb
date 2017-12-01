class Board < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :posts, :dependent => :destroy

  def self.search(search)
    where("name ILIKE ?","%#{search}%")
  end

  # def current_permission
  #   @current_permission ||= Permission.new(current_user)
  # end
  # def authorize
  #   if current_permission.allow?
  #     redirect_to root_url, notice: "not authorized."
  #   end
  # end

end