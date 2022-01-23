class User < ApplicationRecord
  has_many :tests_users, dependent: :delete_all
  has_many :performed_tests, through: :tests_users, source: :test, dependent: :destroy
  has_many :written_tests, foreign_key: "author_id", class_name: "Test", dependent: :delete_all

  def tests_with_level(level)
    Test.joins(:tests_users)
        .where(tests: { level: level }, tests_users: { user_id: self.id })
  end
end
