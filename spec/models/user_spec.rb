require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:goal_comments) }

    it { should have_many(:plan_comments) }

    it { should have_many(:coach_invitations) }

    it { should have_many(:plans) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
