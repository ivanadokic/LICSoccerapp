
class Schedule < ActiveRecord::Base

    belongs_to :player
    belongs_to :event
    validates :player_id, uniqueness: {scope: :event_id, message: "You can not RSVP twice!"}

    scope :attending, -> { where(attending: 'yes') }

end
