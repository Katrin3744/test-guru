class Badge < ApplicationRecord
  belongs_to :rule

  has_many :users_badges, dependent: :delete_all
  has_many :users, through: :users_badges

  validates :title, presence: true
  validates :url_icon, presence: true, url: true

  def get_name_of_param
    rule.params_type.constantize&.find_by(id: params_id)&.title || params_id
  end

  def user_badge_status(current_user_id)
    users_badges.where(user_id: current_user_id).count >= 1 ? "achieved" : "not achieved"
  end
end
