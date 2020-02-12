class Event < ActiveRecord::Base
    belongs_to :team
  
    has_many :schedules
    has_many :players, through: :schedules
end