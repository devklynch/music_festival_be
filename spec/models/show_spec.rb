require 'rails_helper'

RSpec.describe Show, type: :model do
    it { should have_and_belong_to_many(:schedules) }
    it { should validate_presence_of(:artist) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    
end