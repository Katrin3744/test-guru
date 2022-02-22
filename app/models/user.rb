class User < ApplicationRecord
  has_many :test_passages, dependent: :delete_all
  has_many :performed_tests, through: :test_passages, source: :test
  has_many :written_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  validates :email, presence: true

  def tests_with_level(level)
    performed_tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
