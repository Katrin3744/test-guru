class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_number

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_number
    self.errors.add(:base, "too much answers") if self.question.answers.count > 3
  end
end
