class Player < ActiveRecord::Base
    has_many :schedules
    belongs_to :team
    has_many :events, through: :schedules
    
    validates :username, uniqueness: { message: "is already in use. Try again!"}
    validates :age, presence: true
    validates :age, numericality: { greater_than: 5, less_than: 16 }
    
    has_secure_password
end