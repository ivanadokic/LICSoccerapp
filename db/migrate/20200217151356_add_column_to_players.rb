class AddColumnToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :uid, :string
  end
end
