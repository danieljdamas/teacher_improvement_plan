class User < ApplicationRecord
  # Direct associations

  has_many   :goal_comments,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :plan_comments,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :coach_invitations,
             :foreign_key => "coach_id",
             :dependent => :destroy

  has_many   :plans,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
