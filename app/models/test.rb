class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages

  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :timer, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  scope :simple_level, -> { where(level: 0..1) }
  scope :average_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :with_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }).order(title: :desc) }

  def self.titles_tests_category_title(category_title)
    with_category_title(category_title).pluck(:title)
  end

  def get_timer
    timer || "unlimited"
  end
end
