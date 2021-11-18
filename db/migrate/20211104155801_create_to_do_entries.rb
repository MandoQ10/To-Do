class CreateToDoEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :to_do_entries do |t|
      t.string :title
      t.timestamps
    end
  end
end
