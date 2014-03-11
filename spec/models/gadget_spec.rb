require 'spec_helper'

describe Gadget do
  describe "validations" do
    it "should be valid when filled out correctly" do
      @gadget = build(:gadget)
      @user = build(:user)
      @gadget.should be_valid
    end

    describe "name" do
      it "should require name field" do
        @gadget = build(:gadget)
        @user = build(:user)
        @gadget.name = ""
        @gadget.should_not be_valid
      end
    end
    
    describe "description" do
      it "should require a description" do
        @gadget = build(:gadget)
        @user = build(:user)
        @gadget.description = ""
        @gadget.should_not be_valid
      end
    end

    describe "user" do
      it "should require an owner" do
        @gadget = build(:gadget)
        @user = build(:user)
        @gadget.user_id = ""
        @gadget.should_not be_valid
      end
    end
  end

  describe "relations" do
    describe "user" do
      it "should be able to belong to a user" do
        @gadget = build(:gadget)
        @user = build(:user)
        @gadget.user = @user
        @gadget.save
        @gadget.user.should == @user
      end
    end

    describe "images" do
      # it "should be able to have images" do
      # end
    end
  end
end
