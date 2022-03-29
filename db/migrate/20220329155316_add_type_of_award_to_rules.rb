class AddTypeOfAwardToRules < ActiveRecord::Migration[6.1]
  def change
    add_column :rules, :type_of_award, :string, null: false
  end
end
