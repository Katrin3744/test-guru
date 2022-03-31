class RenameColumnPathBadges < ActiveRecord::Migration[6.1]
  def change
    rename_column :badges, :path_icon, :url_icon
  end
end
