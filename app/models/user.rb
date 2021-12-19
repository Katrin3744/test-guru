class User < ApplicationRecord
  def test_with_level(level)
    Test.joins("INNER JOIN test_users ON tests.id = test_users.test_id ").where("tests.level= :level AND test_users.user_id = :user_id",level: level, user_id: self.id)
  end
end
