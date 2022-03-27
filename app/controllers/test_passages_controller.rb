class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :result, :update]

  def show
  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      badges = []
      @accessible_badges_id = UsersBadgesService.new(@test_passage, current_user).application_rules_badges
      @accessible_badges_id.map { |badge_id| badges.push({ badge_id: badge_id, user_id: current_user.id }) }
      UsersBadge.create!(badges)
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
