class ContentGenre < ApplicationRecord
  # model association
  belongs_to :content
  belongs_to :genre
end
