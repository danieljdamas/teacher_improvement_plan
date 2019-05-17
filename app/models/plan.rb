class Plan < ApplicationRecord
  # Direct associations

  has_many   :coaches,
             :class_name => "CoachInvitation",
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User"

  # Indirect associations

  # Validations

end
