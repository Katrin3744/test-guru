class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: "author_id"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.tests_with_category_name(category)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id")
        .where(categories: { category: category })
        .order(title: :desc)
        .pluck(:title)
  end
end
