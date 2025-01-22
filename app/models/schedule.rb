class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true

    belongs_to :user
    has_and_belongs_to_many :shows
end