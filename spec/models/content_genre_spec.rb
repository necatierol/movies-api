require 'rails_helper'

RSpec.describe ContentGenre, type: :model do
  # Association test
  it { should belong_to(:content) }
  it { should belong_to(:genre) }
end
