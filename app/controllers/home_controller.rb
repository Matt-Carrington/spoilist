class HomeController < ApplicationController

  def index
    @lists = List.where(user_id: current_user)
    @list_items = ListItem.order(due_date: :ASC)
   end
  
end
