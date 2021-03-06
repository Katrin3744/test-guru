class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, url: result.url, user: current_user)
      flash_options = { notice: t('.success_creating_gist', href: view_context.link_to(t('.gist_href'), result.url, target: '_blank')).html_safe }
    else
      flash_options = { alert: t('.failure_creating_gist') }
    end
    redirect_to @test_passage, flash_options
  end
end
