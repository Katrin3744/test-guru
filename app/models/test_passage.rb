class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question
  SUCCESS_RATIO = 85.0

  def completed?
    current_question.nil?
  end

  def successful?
    self.result >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.result = result_calculation
    save!
  end

  def number_of_questions
    test.questions.count
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def result_calculation
    (correct_questions.to_d / test.questions.count.to_d) * 100
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id>?', current_question.id).first
    end
  end
end
