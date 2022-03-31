class AddToBadgeRulesColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_value, :integer, null: true
  end
end
