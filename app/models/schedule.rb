
class Schedule < ActiveRecord::Base

    belongs_to :player
    belongs_to :event


    #scope :attending, -> { where(attending: yes) }

end
