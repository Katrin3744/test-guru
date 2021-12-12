class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :answer_body
      t.integer :question_id
      t.string :correct

      t.timestamps
    end
  end
end
