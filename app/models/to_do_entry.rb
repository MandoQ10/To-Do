class ToDoEntry < ApplicationRecord
    validates :title, presence: true
end
