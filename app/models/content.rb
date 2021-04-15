class Content < ApplicationRecord
  # model association
  has_many :seasons, dependent: :destroy
  has_many :content_genres, dependent: :destroy

  #validations
  validates_presence_of :title, :description
end
