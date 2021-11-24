class ToDoEntry < ApplicationRecord

    def sort_date(other)

        self_due_date = self[:due_date]
        other_due_date = other.due_date
        
        if self_due_date == nil && other_due_date == nil
            return -1
        end 

        if self_due_date == nil && other_due_date != nil
            return 1
        end

        if self_due_date != nil && other_due_date == nil
            return -1
        end

        if other_due_date == self_due_date 
            0
        elsif self_due_date > other_due_date
            1
        else 
            -1
        end
    end 

    def formatted_date
        if self[:due_date]
            self[:due_date].to_formatted_s(:long)     
        end
    end 

    def due_date_passed? 
        if self[:due_date]
            if self[:due_date] < Date.today
                "past-due"
            end
        end
    end
     
    validates :title, presence: true
    validates :due_date, date: { after_or_equal_to: Proc.new {Date.today},
    message: 'Selected Due date must be today or a future date'}, allow_blank: true
end
