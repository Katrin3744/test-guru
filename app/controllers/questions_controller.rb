class QuestionsController < ApplicationController
  before_action :find_test

  def index
  end

  def show
    render inline: '<%=@test.questions.find(params[:id]).body%>'
  end

  private

  def find_test
    @test =Test.find(params[:test_id])
  end
end
