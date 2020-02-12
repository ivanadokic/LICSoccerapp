class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.string :event_type
      t.datetime :start
      t.datetime :end
      t.integer :team_id
    end
  end
end
