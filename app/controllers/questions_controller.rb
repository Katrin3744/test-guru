class QuestionsController < ApplicationController
  before_action :find_test, only: [:create, :index, :new]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @question.destroy
    render plain: 'Question was delete!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test)
  end

  def rescue_with_record_not_found
    render plain: 'Question was not found'
  end
end
