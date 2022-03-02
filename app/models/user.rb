class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages, dependent: :delete_all
  has_many :performed_tests, through: :test_passages, source: :test
  has_many :written_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP

  def tests_with_level(level)
    performed_tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
