require 'rails_helper'

RSpec.describe PlanComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:plan) }

    it { should belong_to(:author) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
