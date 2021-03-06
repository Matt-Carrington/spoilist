 class ListItemsController < ApplicationController
  before_action :set_list
  before_action :set_list_item, except: [:create]

  def create
    @list_item = @list.list_items.create(list_item_params)
    redirect_to @list
  end

  def destroy
    @list_item.destroy
    redirect_to @list
  end

  def complete
    @list_item.update_attribute(:completed_at, Time.now)
    @list_item.update_attribute(:point_value, 1)
    @user_points = current_user.points + 1
    current_user.update_attribute(:points, @user_points )
    redirect_to @list
  end

  # def due_date
  #   @due_date = @list_item.due_date
  # end

  # def complete
  #   @list_item.toggle_completion!
  #   redirect_to @list
  # end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_list_item
    @list_item = @list.list_items.find(params[:id])
  end

  def list_item_params
    params[:list_item].permit(:content, :color, :point_value, :list_id, :due_date)
  end
end
