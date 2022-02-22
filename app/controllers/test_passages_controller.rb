class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :result, :update]

  def show
    calculate_number_of_questions
  end

  def result
    @test_result = @test_passage.result_calculation
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      calculate_number_of_questions
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def calculate_number_of_questions
    @number_of_questions = @test_passage.number_of_questions
    @question_number = @test_passage.current_question_number
  end
end
