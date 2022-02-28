class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:create, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def new
    @question = Question.new
    @question.test = @test
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    test_id = @question.test_id
    @question.destroy
    redirect_to admin_test_path(Test.find(test_id))
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
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
