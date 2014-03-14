require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReservationsHelper. For example:
#
# describe ReservationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ReservationsHelper do
  
  describe "#week_days" do
    it "return an array with {db_key => formatted_name} for each week day from Mon to Fri" do
      wdays = [ "Mon", "Tue", "Wed", "Thu", "Fri" ]
                
      expect(helper.week_days).to eq(wdays)
    end
  end
  
  describe "#week_days" do
    it "return an array with {db_key => formatted_name} for each week day from Mon to Fri" do
      hours = [ "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", 
                "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00" ]
                
      expect(helper.hours).to eq(hours)
    end
  end
  
  describe "#reserved_for" do
    it "return the name of the reservation's user" do
      user = FactoryGirl.create(:user, first_name: "rodrigo")
      reservation = FactoryGirl.build(:reservation, user: user)

      expect(helper.reserved_for reservation).to eq("Rodrigo")
    end
  end

  describe "#reserved_for_current_user?" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
    end

    it "return true if it's reserved for the current user" do
      reservation = FactoryGirl.build(:reservation, user: @user)

      expect(helper.reserved_for_current_user?(reservation)).to eq(true)
    end

    it "return false if it's not reserved for the current user" do
      reservation = FactoryGirl.build(:reservation)

      expect(helper.reserved_for_current_user?(reservation)).to eq(false)
    end
  end

  describe "#remove_colon" do
    it "removes all colons of a string" do
      hour = "06:00"
      expect(helper.remove_colons(hour)).to eq("0600")
    end
  end

end
