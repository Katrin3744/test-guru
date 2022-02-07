class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answers

  private

  def validate_answers
    errors.add(:answers) if answers.count > 3
  end
end
