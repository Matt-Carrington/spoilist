class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.where(user_id: current_user)
  end

  def show
  end

  def new
    @list = current_user.lists.build
  end

  def edit
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
    @theme = @list.color
  end

  def list_params
    params.require(:list).permit(:color, :title)
  end
end
