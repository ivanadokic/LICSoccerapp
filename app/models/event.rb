class Event < ActiveRecord::Base
    belongs_to :team
  
    has_many :schedules
    has_many :players, through: :schedules
   
    validates :location, presence: true
    validates :event_type, presence: true
    validates :start, presence: true

def self.search(search)
    if search
        find(:all, :contains =>['event_type like ?', "%#{search}%"])
    else
        find(:all)
    end
end
end