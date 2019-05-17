class Plan < ApplicationRecord
  # Direct associations

  has_many   :goals,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User"

  # Indirect associations

  # Validations

end
