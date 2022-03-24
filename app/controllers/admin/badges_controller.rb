class Admin::BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_badge, only: [:show, :destroy, :update, :edit]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create!(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :path_icon, :rule_id, :params_id)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
