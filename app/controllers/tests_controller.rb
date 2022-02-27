class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @test = Test.all
  end

  def start
    current_user.performed_tests.push(@test)
    redirect_to current_user.test_passage(@test)
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
