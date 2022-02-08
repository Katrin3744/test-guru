class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_number, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    errors.add(:base, "too much answers") if question.answers.count >= 4
  end
end
