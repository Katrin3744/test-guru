class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
    add_index :tests, [:title, :level], unique: true
  end
end
