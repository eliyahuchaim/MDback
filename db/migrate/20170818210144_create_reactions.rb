class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.string :point_1
      t.string :point_2
      t.string :point_3
      t.string :content
      t.integer :article_id
      t.integer :user_id
      t.integer :initial_score, default: 0
      t.integer :final_score, default: 0

      t.timestamps
    end
  end
end
