require 'rails_helper'

RSpec.describe UserWatchHistory, type: :model do
  # Association test
  it { should belong_to(:content) }
  it { should belong_to(:user) }
  # Validation tests
  it { should validate_presence_of(:status) }
end
