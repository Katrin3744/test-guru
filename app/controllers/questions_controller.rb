class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def new
  end

  def create
    @question = Question.create!({body: params[:question][:body], test_id: params[:test_id].to_i})
    render plain: 'Question was created!'
  end

  def show
  end

  def destroy
    @question =Question.find(params[:id])
    @question.destroy
    render plain: 'Question was delete!'
  end

  private

  def find_test
    @test =Test.find(params[:test_id])
  end

  def rescue_with_record_not_found
    render plain: 'Question was not found'
  end
end
