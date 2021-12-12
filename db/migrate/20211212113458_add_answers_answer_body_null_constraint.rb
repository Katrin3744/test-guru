class AddAnswersAnswerBodyNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers,:answer_body,false)
  end
end
