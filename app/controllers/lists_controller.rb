class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def find_list
    @list = List.find(params[:id])

  end

  def list_params
    params.require(:list).permit(:color, :title)
  end
end
