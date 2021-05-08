require 'rails_helper'

RSpec.describe UserWatchList, type: :model do
  # Association test
  it { should belong_to(:content) }
  it { should belong_to(:user) }
end
