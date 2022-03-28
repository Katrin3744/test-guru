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
    result_calculation >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    if test.timer.present? && timer_calculating > time_for_test_passage
      current_question = nil
      puts "++++++++"
    else if correct_answer?(answer_ids)
      self.correct_questions += 1
         end
    end
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

  def timer_calculating
    DateTime.current.to_time - created_at
  end

  def time_for_test_passage
    test.timer.present? ? test.timer * 60 : "unlimited time"
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
