class Event < ActiveRecord::Base
    belongs_to :team
  
    has_many :schedules
    has_many :players, through: :schedules
   
    validates :location, presence: true
    validates :event_type, presence: true
    validates :start, presence: true

def self.search(search)
    if search
        send(:where, :contains =>['event_type like ?', "%#{search}%"])
    else
        all
    end
end
end