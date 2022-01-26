class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :delete_all
  has_many :users, through: :tests_users

  def self.tests_with_category_title(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
