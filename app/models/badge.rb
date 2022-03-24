class Badge < ApplicationRecord
  has_many :users_badges, dependent: :delete_all
  has_many :users, through: :users_badges
  belongs_to :rule

  validates :title, presence: true
  validates :path_icon, presence: true

  def get_name_of_param
    class_of_param = rule.params_type.constantize
    class_of_param.find(params_id).title
  end

  def user_have_badge?(current_user_id)
    users_badges.where(user_id: current_user_id).count == 1 ? "yes" : "no"
  end
end
