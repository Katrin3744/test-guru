class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user, presence: true
  validates :question, presence: true
  validates :url, presence: true

  def url_hash
    split_url = self.url.split("/")
    split_url.last
  end
end
