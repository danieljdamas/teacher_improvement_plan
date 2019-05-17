require 'rails_helper'

RSpec.describe Plan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:plan_comments) }

    it { should have_many(:coaches) }

    it { should have_many(:goals) }

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
