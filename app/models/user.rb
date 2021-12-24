class User < ApplicationRecord
  has_many :tests_users
  has_many :performed_tests, through: :tests_users, source: :test
  has_many :written_tests, foreign_key: "author_id", class_name: "Test"

  def tests_with_level(level)
    Test.joins("INNER JOIN test_users ON tests.id = test_users.test_id ")
        .where(tests: { level: level }, test_users: { user_id: self.id })
  end
end
