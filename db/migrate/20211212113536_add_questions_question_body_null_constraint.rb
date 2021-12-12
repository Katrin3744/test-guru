class AddQuestionsQuestionBodyNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions,:question_body,false)
  end
end
