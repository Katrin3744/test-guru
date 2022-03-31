class AddResultToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :result, :float, null: true
  end
end
