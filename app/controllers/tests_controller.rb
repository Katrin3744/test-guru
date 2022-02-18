class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]

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

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :body, :category_id, :author_id)
  end
end
