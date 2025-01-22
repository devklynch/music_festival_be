class Show < ApplicationRecord
    validates :artist, presence: true
    validates :location, presence: true 
    validates :date, presence: true 
    validates :start_time, presence: true 
    validates :end_time, presence: true 

    has_and_belongs_to_many :schedules
end