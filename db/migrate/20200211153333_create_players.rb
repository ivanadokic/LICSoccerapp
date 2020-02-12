class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :username
      t.integer :age
      t.integer :team_id
    end
  end
end
