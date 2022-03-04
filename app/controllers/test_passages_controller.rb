class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :result, :update, :gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    data = JSON.parse(result.body)
    gist_url = data["html_url"]

    if result.status == 201
      Gist.create(question: @test_passage.current_question, url: gist_url, user: current_user)
      flash_options = { notice: t('.success') + " #{view_context.link_to 'TestGuru gist', gist_url, target: '_blank'}" }
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
