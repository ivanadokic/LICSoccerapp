class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :team_id
      t.integer :player_id
      t.string :attending
    end
  end
end
