class PlanComment < ApplicationRecord
  # Direct associations

  belongs_to :plan

  belongs_to :author,
             :class_name => "User"

  # Indirect associations

  # Validations

end
