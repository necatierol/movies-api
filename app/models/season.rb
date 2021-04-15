class Season < ApplicationRecord
  # model association
  belongs_to :content
  has_many :episodes, dependent: :destroy

  # validations
  validates_presence_of :title
end
