class User < ApplicationRecord
  has_many :post_histories
  has_many :posts, :through => :post_histories
  has_many :user_statuses
  has_many :user_roles
  has_many :user_groups
  has_many :groups, :through => :user_groups
  has_secure_password
  validates :password,  :presence => :true,
                        :confirmation => true,
                        :length => {:within => 6..50}
  validates_uniqueness_of :username

  ROLES = %i[user manager]

  #import csv
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash
      user = User.where(username: user_hash["username"])
      if user.count == 1
        user.first.update_attributes(user_hash)
      else
        User.create!(user_hash)
      end # end if statemnet
    end # end foreach
  end # end method

end

def formatted_name
  "#{fname} #{lname}"
end