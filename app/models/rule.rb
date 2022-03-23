class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :title, presence: true
end
