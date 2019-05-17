class CreateCoachInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_invitations do |t|
      t.integer :coach_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
