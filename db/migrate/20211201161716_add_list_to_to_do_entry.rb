class AddListToToDoEntry < ActiveRecord::Migration[6.1]
  def change
    add_reference :to_do_entries, :list, null: false, foreign_key: true
  end
end
