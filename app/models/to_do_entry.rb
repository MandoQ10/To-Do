class ToDoEntry < ApplicationRecord
    attribute :title, :string
    attribute :completed, :boolean
    validates :title, presence: true
end
