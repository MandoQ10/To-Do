class ToDoEntry < ApplicationRecord
   
    def formatted_date
        if self[:due_date]
            self[:due_date].to_formatted_s(:long)     
        end
    end 
     
    validates :title, presence: true
    validates :due_date, date: { after_or_equal_to: Proc.new {Date.today},
    message: 'Selected Due date must be today or a future date'}, allow_blank: true
end
