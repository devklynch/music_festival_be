class User < ApplicationRecord
    has_one :schedule
    has_many :shows, through: :schedule
   
end