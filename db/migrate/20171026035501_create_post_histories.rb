class CreatePostHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :post_histories do |t|
      t.string :action
      t.datetime :date
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
