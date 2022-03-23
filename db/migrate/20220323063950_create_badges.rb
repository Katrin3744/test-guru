class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :path_icon, null: false
      t.references :rule, null: false, foreign_key: true
      t.integer :params_id
      t.timestamps
    end
  end
end
