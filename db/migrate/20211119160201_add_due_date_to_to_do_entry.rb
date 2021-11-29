class AddDueDateToToDoEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :to_do_entries, :due_date, :date
  end
end
