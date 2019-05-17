class CreateGoalComments < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_comments do |t|
      t.text :comment
      t.integer :author_id
      t.integer :goal_id

      t.timestamps
    end
  end
end
