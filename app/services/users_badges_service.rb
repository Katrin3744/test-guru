class UsersBadgesService
  RULES = {
    all_category_tests_pass: Badges::FinishAllTestsCategory,
    all_tests_first_pass: Badges::FinishAnyTestFirstTime,
    all_level_tests_pass: Badges::FinishAllTestsWithLevel,
    first_pass_test: Badges::FinishTestFirstTime
  }.freeze

  def initialize (test)
    @test_passage = test
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule.type_of_award.to_sym].new(value: badge.rule_value, test_passage: @test_passage)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges.push(badge)
  end
end
