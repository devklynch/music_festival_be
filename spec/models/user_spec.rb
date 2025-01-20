require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_one(:schedule) }
    it { should have_many(:shows).through(:schedule) }
   
end