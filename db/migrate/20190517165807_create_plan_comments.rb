class CreatePlanComments < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_comments do |t|
      t.text :comment
      t.integer :author_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
