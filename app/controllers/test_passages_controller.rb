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
      @test_passage.save_result
      TestsMailer.completed_test(@test_passage).deliver_now
      UsersBadgesService.new(@test_passage).call
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
