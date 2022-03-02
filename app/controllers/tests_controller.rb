class TestsController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @test = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.performed_tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def rescue_with_record_not_found
    render plain: 'Test was not found'
  end
end
