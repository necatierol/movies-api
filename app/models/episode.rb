class Episode < ApplicationRecord
  # model association
  belongs_to :season

  # validations
  validates_presence_of :title
end
