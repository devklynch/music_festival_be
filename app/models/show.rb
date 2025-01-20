class Show < ApplicationRecord
    has_many :users, through: :schedules
    has_many :schedules
end