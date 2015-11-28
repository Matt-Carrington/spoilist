 class ListItemsController < ApplicationController
  before_action :set_list
  before_action :set_list_item, except: [:create]

  def create
    @list_item = @list.list_items.create(list_item_params)
    redirect_to @list
  end

  def destroy
    if @list_item.destroy
      flash[:success] = "List item was deleted."
    else
      flash[:error] = "List item was not able to be deleted."
    end
    redirect_to @list
  end

  def complete
    @list_item.update_attribute(:completed_at, Time.now)
    redirect_to @list, notice: "Completed!"
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
