class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @test = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
    @question = @test.questions
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def start
    @current_user.performed_tests.push(@test)
    redirect_to @current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :body, :category_id, :author_id)
  end

  def rescue_with_record_not_found
    render plain: 'Test was not found'
  end
end
