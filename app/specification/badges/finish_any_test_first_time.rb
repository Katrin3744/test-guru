class Badges::FinishAnyTestFirstTime < AbstractRuleSpecification
  def satisfies?
    @test_passage.result >= TestPassage::SUCCESS_RATIO &&
      TestPassage.where(test: @test_passage.test, user: @test_passage.user).count == 1
  end
end
