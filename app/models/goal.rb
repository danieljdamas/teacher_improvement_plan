class Goal < ApplicationRecord
  # Direct associations

  has_many   :goal_comments,
             :dependent => :destroy

  has_many   :action_steps,
             :dependent => :destroy

  belongs_to :plan

  # Indirect associations

  # Validations

end
