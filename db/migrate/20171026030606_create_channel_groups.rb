class CreateChannelGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :channel_groups do |t|
      t.integer :group_id
      t.integer :channel_id
      t.datetime :date

      t.timestamps
    end
  end
end
