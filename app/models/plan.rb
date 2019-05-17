class Plan < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User"

  # Indirect associations

  # Validations

end
