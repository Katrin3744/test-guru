class Test < ApplicationRecord

  def self.tests_category_name(name)
    category= Category.where(category: name).select(:id)
    Test.where(category_id: category).select(:title).order(title: :asc)
  end

end
