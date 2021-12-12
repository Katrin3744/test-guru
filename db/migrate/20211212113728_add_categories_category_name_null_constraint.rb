class AddCategoriesCategoryNameNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories,:category_name,false)
  end
end
