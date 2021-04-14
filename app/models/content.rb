class Content < ApplicationRecord
  # model association 
  has_many :seasons, dependent: :destroy

  #validations
  validates_presence_of :title, :description
end
