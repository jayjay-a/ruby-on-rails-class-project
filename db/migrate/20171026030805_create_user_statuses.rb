class CreateUserStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_statuses do |t|
      t.integer :user_id
      t.string :status_description

      t.timestamps
    end
  end
end
