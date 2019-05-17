class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.text :description
      t.string :status
      t.integer :owner_id

      t.timestamps
    end
  end
end
