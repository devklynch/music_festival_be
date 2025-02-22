class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true 
    validates :email, presence: true

    has_one :schedule
    has_many :shows, through: :schedule
   
end