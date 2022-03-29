class Badges::FinishAllTestsCategory < AbstractRuleSpecification
  def satisfies?
    tests_with_category = Test.where(category_id: @value)
    success_user_tests_with_category = tests_with_category.joins(:test_passages)
                                            .where("user_id = :user_id and result >= :result",
                                                   user_id: @test_passage.user_id,
                                                   result: TestPassage::SUCCESS_RATIO).distinct
    tests_with_category.count == success_user_tests_with_category.count
  end
end

