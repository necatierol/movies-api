class Season < ApplicationRecord
  # model association
  belongs_to :content
  has_many :episodes, dependent: :destroy

  # validation
  validates_presence_of :title
end
