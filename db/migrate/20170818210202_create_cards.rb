class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :reaction_id

      t.timestamps
    end
  end
end
