class Player < ActiveRecord::Base
    has_many :schedules
    belongs_to :team
    has_many :events, through: :schedules

    validates :age presence: true
    validates :age, numericality: { greater_than: 5, less_than: 16 }
   
end