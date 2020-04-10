class Event < ActiveRecord::Base
    belongs_to :team
  
    has_many :schedules
    has_many :players, through: :schedules
   
    validates :location, presence: true
    validates :event_type, presence: true
    validates :start, presence: true
    scope :search, -> (text) { 
        where("event_type ilike :text or location ilike :text", text: "%#{text}%")
    }
   
end