class User < ApplicationRecord
  has_many :post_histories
  has_many :posts, :through => :post_histories
  has_many :user_statuses
  has_many :user_roles
  has_many :user_groups
  has_many :groups, :through => :user_groups
  require 'csv'

  #def self.to_csv(fields=column_names, options={})
  #CSV.generate(options) do |csv|
  #  csv << fields
  #    all.each do |user|
  #      csv << user.attributes.values_at(*fields)
  #    end
  #  end
  #end

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      users_hash = row.to_hash
      user = find_or_create_by!(fname: users_hash['fname'])
      user.update_attributes(users_hash)
    end
  end


end
def formatted_name
  "#{fname} #{lname}"
end
