class CreateTestUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :test_users do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :test, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
