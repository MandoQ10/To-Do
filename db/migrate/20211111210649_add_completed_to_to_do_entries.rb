class AddCompletedToToDoEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :to_do_entries, :completed, :boolean, :default => false 
  end
end
