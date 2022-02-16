class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question
  skip_before_action :find_test, only: [:show, :destroy]
  skip_before_action :find_question, only: [:create, :index, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def new
  end

  def create
    @question_new = @test.questions.build({ body: params[:question][:body], test: @test })
    if @question_new.save
      redirect_to @question_new
    else
      render :new
    end
  end

  def show
    @question_by_id = @question.body
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

  def rescue_with_record_not_found
    render plain: 'Question was not found'
  end
end
