class SpoilsController < ApplicationController
  before_action :set_spoil

  def index
    @spoils = Spoil.where(user_id: current_user)
  end

  def show
    @spoil = Spoil.find(params[:id])
  end

  def new
    @spoil = current_user.spoils.build
  end

  def edit
  end

  def complete
    @user_points = current_user.points
    @spoil_value = @spoil.point_value
    if @user_points >= @spoil_value
      @spoil.update_attribute(:completed_at, Time.now)
      @user_points = current_user.points - @spoil_value
      current_user.update_attribute(:points, @user_points )
      redirect_to spoils_path
      @spoil.destroy
    else
      redirect_to spoil_path, notice: "You don't have enough points for this :("
    end
  end

  def create
    @spoil = current_user.spoils.build(spoil_params)

    if @spoil.save
      redirect_to spoils_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @spoil.destroy
    respond_to do |format|
      format.html { redirect_to spoils_path }
      format.json { head :no_content }
    end
  end

  private

  def set_spoil
    @spoil = Spoil.find_by(params[:id])
  end

  def spoil_params
    params.require(:spoil).permit(:content, :point_value, :user_id)
  end

end
