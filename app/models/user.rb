class User < ApplicationRecord
    has_many :shows, through: :schedules
    has_one :schedule
end