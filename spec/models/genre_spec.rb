require 'rails_helper'

RSpec.describe Genre, type: :model do
  # Association test
  it { should have_many(:content_genres).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:title) }
end
