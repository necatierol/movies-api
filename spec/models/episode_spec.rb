require 'rails_helper'

RSpec.describe Episode, type: :model do
  # Association test
  it { should belong_to(:season) }
  # Validation test
  # ensure column title is present before saving
  it { should validate_presence_of(:title) }
end
