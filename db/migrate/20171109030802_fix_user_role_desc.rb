class FixUserRoleDesc < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_roles, :role_description_string, :role_description
  end
end
