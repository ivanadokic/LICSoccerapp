
class Schedule < ActiveRecord::Base

    belongs_to :player
    belongs_to :event 
end
