class AddAnswersConditionDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default :answers, :correct, "correct"
  end

  def down
    change_column_default :answers, :correct, nil
  end

end
