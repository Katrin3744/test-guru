class Admin::TestsController < Admin::BaseController
  before_action :find_tests_and_gists, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :edit, :update, :destroy, :update_inline]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.written_tests.build(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def show
    @question = @test.questions
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests_and_gists
    @gists = Gist.all
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :body, :category_id, :timer)
  end

  def rescue_with_record_not_found
    render plain: 'Test was not found'
  end
end
