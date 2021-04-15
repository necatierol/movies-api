class Genre < ApplicationRecord
  # model association
  has_many :content_genres, dependent: :destroy

  # validations
  validates_presence_of :title
end
