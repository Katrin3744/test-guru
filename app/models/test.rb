class Test < ApplicationRecord
  def self.tests_category_name(name)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id AND categories.category = '#{name}'").select(:title).order(title: :desc).to_a
  end
end
