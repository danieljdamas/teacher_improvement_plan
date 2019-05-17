class GoalComment < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "User"

  # Indirect associations

  # Validations

end
