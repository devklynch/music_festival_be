require 'rails_helper'

RSpec.describe Schedule, type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:show) }
end