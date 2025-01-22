require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_one(:schedule) }
    it { should have_many(:shows).through(:schedule) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
end