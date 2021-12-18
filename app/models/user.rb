class User < ApplicationRecord
  def test_with_level(level)
    Test.joins("INNER JOIN test_users ON tests.id = test_users.test_id AND test_users.user_id = #{self.id}").where(level: level)
  end
end
