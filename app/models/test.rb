class Test < ApplicationRecord
  def self.tests_with_category(category)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id").where(categories:{ category: category}).order(title: :desc).pluck(:title)
  end
end
