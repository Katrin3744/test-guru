class RemoveParamsIdFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :params_id, :integer
  end
end
