class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :title, presence: true
  validates :type_of_award, presence: true
end
