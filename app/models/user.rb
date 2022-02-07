class User < ApplicationRecord
  has_many :tests_users, dependent: :delete_all
  has_many :performed_tests, through: :tests_users, source: :test
  has_many :written_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  validates :email, presence: true

  def tests_with_level(level)
    performed_tests.where(level: level)
  end
end
