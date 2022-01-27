class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :delete_all
  has_many :users, through: :tests_users

  scope :simple_tests, -> { where(level: 0..1) }
  scope :average_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :tests_with_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title) }

  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: {scope: :level}
  validate :validate_type_level, on: :create

  private

  def validate_type_level
    errors.add(:level) if level.to_i < 0
  end
end
