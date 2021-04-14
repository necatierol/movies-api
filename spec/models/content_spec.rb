require 'rails_helper'

RSpec.describe Content, type: :model do
  # Association test
  # ensure Content model has a 1:m relationship with the Season model
  it { should have_many(:seasons).dependent(:destroy) }
  # Validation tests
  # ensure columns title and description are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
