class CoachInvitation < ApplicationRecord
  # Direct associations

  belongs_to :plan

  belongs_to :coach,
             :class_name => "User"

  # Indirect associations

  # Validations

end
