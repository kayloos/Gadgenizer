require 'spec_helper'

describe User do
  before(:each) do
    @user = create(:user)
  end

  describe "validations" do
    describe "email" do
      it "should not validate empty email" do
        @user.email = ""
        @user.should_not be_valid
      end

      it "should not validate no at sign" do
        @user.email = "noatsign.com"
        @user.should_not be_valid
      end

      it "should not validate no domain" do
        @user.email = "nodomain@gadgenizer"
        @user.should_not be_valid
      end

      it "should validate valid email" do
        @user.email = "valid@email.com"
        @user.should be_valid
      end
    end

    describe "password" do
      it "should not accept empty password" do
        @user.password = ""
        @user.should_not be_valid
      end

      it "should not accept lower than 8 characters" do
        pw = "1234567"
        @user.password = pw
        @user.password_confirmation = pw
        @user.should_not be_valid
      end

      it "should not accept more than 128 characters" do
        pw = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        @user.password = pw
        @user.password_confirmation = pw
        @user.should_not be_valid
      end

      it "should accept password within the range 8..128" do
        pw = "password"
        @user.password = pw 
        @user.password_confirmation = pw
        @user.should be_valid
      end
    end
  end

  describe "relations" do
    before(:each) do
      @gadget1 = build(:gadget)
      @gadget2 = build(:gadget)
    end
    describe "gadget" do
      it "should be able to own gadgets" do
        @user.gadgets << @gadget1
        @user.gadgets << @gadget2
        @user.reload.gadgets.should include(@gadget1, @gadget2)
      end
    end
  end
end
