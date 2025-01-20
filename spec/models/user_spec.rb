require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:schedules) }
    it { should have_many(:shows).through(:schedules) }
   
end