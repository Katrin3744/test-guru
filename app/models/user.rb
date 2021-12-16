class User < ApplicationRecord

  def test_with_level(level)
    id_tests= Test.where(level: level)
    id_mass=[]
    id_tests.each{|test| id_mass.push(test.id)}
    TestUser.where("test_id IN (:id_tests) AND user_id = :id_user",id_tests: id_mass, id_user: self.id)
  end


end
