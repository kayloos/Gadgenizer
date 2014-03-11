require 'spec_helper'

describe Gadget do
  before(:all) do
    @default_gadget = build(:gadget)
    user = create(:user)
  end
  describe "validations" do
    before(:each) do
      @gadget = user << default_gadget
    end

    it "should be valid when filled out correctly" do
      @gadget.should be_valid
    end

    describe "name" do
      it "should require name field" do
        @gadget.name = ""
        @gadget.should_not be_valid
      end
    end
    
    describe "description" do
      it "should require a description" do
        @gadget.description = ""
        @gadget.should_not be_valid
      end
    end

    describe "user" do
      it "should require an owner" do
        @gadget.user = ""
        @gadget.should_not be_valid
      end
    end
  end

  describe "relations" do
    describe "user" do
      it "should be able to belong to a user" do
        user << @default_gadget
        @default_gadget.save
        @default_gadget.user.should == user
      end
    end

    describe "images" do
      # it "should be able to have images" do
      # end
    end
  end
end
