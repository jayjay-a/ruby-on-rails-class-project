class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.datetime :date
      t.integer :channel_id

      t.timestamps
    end
  end
end
