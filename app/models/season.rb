class Season < ApplicationRecord
  # model association
  belongs_to :content

  # validation
  validates_presence_of :title
end
