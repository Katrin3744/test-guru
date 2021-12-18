class CreateAnswerUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_users do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :answer, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
