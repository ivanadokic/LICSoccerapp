class Player < ActiveRecord::Base
    has_many :schedules
    belongs_to :team, optional: true
    has_many :events, through: :schedules
    
    validates :username, uniqueness: { message: "is already in use. Try again!"}
    validates :age, presence: true
    validates :age, numericality: { greater_than: 4, less_than: 16, message: "%{value} seems wrong, must be greater than 4 and lees than 16yearss old" }
    
    has_secure_password #validation require password confirmation 

    def assign_team
        t = Team.find_by_age(self.age + 1) 
        if t.nil?
        t = Team.find_by_age(self.age + 2)  
        end
        self.team = t
        self.save
    end
    
end