require 'rails_helper'

RSpec.describe Schedule, type: :model do
    it { should have_many(:shows) }
    it { should have_many(:users).through(:shows) }
end