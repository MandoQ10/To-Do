class List < ApplicationRecord
    has_many :to_do_entries, dependent: :destroy
end
