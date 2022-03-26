class UsersBadgesService
  def initialize (test, user)
    @test_passage = test
    @user = user
  end

  def application_rules_badges
    @badges = Badge.all
    @response = []
    all_user_tests = TestPassage.where(user_id: @user)
    @badges.each do |badge|
      case badge.rule_id
      when 1
        @response.push(badge.id) if badges_for_all_category_tests(all_user_tests)
      when 2
        @response.push(badge.id) if @test_passage.correct_questions == @test_passage.test.questions.count
      when 3
        @response.push(badge.id) if badges_for_level_tests(all_user_tests)
      when 4
        test = Test.find(badge.params_id)
        @response.push(badge.id) if test.questions.count == @test_passage.correct_questions &&
          badge.params_id == @test_passage.test_id
      end
    end
    @response
  end

  def badges_for_all_category_tests(all_user_tests)
    sum1 = 0
    sum2 = 0
    all_user_tests.each do |test_passage|
      sum1 += test_passage.correct_questions if test_passage.test.category.id == badge.params_id
    end
    all_category_tests = @test_passage.test.category.tests
    all_category_tests.each do |test|
      sum2 += test.questions.count
    end
    sum1 == sum2
  end

  def badges_for_level_tests(all_user_tests)
    sum1 = 0
    sum2 = Test.where(level: badge.params_id).count
    unique_user_test = all_user_tests.select(:test_id, :correct_questions).distinct
    unique_user_test.each do |tests_passage|
      sum1 += 1 if tests_passage.test.level == badge.params_id &&
        tests_passage.correct_questions == tests_passage.test.questions.count
    end
    sum1 == sum2
  end
end
