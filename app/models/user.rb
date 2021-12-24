class User < ApplicationRecord
  def tests_with_level(level)
    Test.joins("INNER JOIN test_users ON tests.id = test_users.test_id ").where(tests: {level: level}, test_users: {user_id: self.id})
  end
end
