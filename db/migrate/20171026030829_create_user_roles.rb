class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.integer :user_id
      t.string :role_description_string

      t.timestamps
    end
  end
end
