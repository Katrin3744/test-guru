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
        sum1 = 0
        all_user_tests.each do |test_passage|
          if test_passage.test.category.id == badge.params_id
            sum1 += test_passage.correct_questions
          end
        end
        sum2 = 0
        all_category_tests = @test_passage.test.category.tests
        all_category_tests.each do |test|
          sum2 += test.questions.count
        end
        if sum1 == sum2
          @response.push(badge.id)
        end
      when 2
        @response.push(badge.id) if @test_passage.correct_questions == @test_passage.test.questions.count

      when 3
        sum1 = 0
        sum2 = Test.where(level: badge.params_id).count
        unique_user_test = all_user_tests.select(:test_id, :correct_questions).distinct
        unique_user_test.each do |tests_passage|
          sum1 += 1 if tests_passage.test.level == badge.params_id and tests_passage.correct_questions == tests_passage.test.questions.count
        end
        if sum1 == sum2
          @response.push(badge.id)
        end

      when 4
        test = Test.find(badge.params_id)
        if test.questions.count == @test_passage.correct_questions and badge.params_id == @test_passage.test_id
          @response.push(badge.id)
        end
      end
    end
    @response
  end
end
