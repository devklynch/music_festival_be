require 'rails_helper'

RSpec.describe Show, type: :model do
    it { should have_and_belong_to_many(:schedules) }
    
end