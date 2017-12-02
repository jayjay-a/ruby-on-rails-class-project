class AddCToBoard < ActiveRecord::Migration[5.1]
  def change
    add_column :boards, :message, :text
  end
end
