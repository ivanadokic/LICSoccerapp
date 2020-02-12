class Team < ActiveRecord::Base
    has_many :events
    has_many :schedules, through: :events
    has_many :players  

    validates :age, numericality: { greater_than: 5, less_than: 16 }
end