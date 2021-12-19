class Test < ApplicationRecord
  def self.tests_category_name(name)
    tests=[]
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.category = :name", name: name).select(:title).order(title: :desc).to_a.each{|test| tests.push(test.title)}
    tests
  end
end
