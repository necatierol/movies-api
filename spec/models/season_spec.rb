require 'rails_helper'

RSpec.describe Season, type: :model do
  # Association test
  # ensure an season record belongs to a single content record
  it { should belong_to(:content) }
  it { should have_many(:episodes).dependent(:destroy) }
  # Validation test
  # ensure column title is present before saving
  it { should validate_presence_of(:title) }
end
