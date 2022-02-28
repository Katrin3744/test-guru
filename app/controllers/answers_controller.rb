class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: [:show]

  def show
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
