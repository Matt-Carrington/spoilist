 class ListItem < ActiveRecord::Base
  belongs_to :list

   def completed?
     !completed_at.blank?
   end

  # def toggle_completion!
  #   if completed?
  #     update_attribute(:completed, nil)
  #   else
  #     update_attribute(:completed, Time.now)
  #   end
  # end

end
