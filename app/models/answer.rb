class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates_associated :question, on: :create

  scope :correct, -> { where(correct: true) }
end
