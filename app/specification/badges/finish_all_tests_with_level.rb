class Badges::FinishAllTestsWithLevel < AbstractRuleSpecification
  def satisfies?
    tests_with_level = Test.where(level: @value)
    success_user_tests_with_level = tests_with_level.joins(:test_passages)
                                         .where("user_id = :user_id and result >= :result",
                                                user_id: @test_passage.user_id,
                                                result: TestPassage::SUCCESS_RATIO).distinct
    tests_with_level.count == success_user_tests_with_level.count
  end
end
