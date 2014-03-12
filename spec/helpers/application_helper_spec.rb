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
describe ApplicationHelper do  
  describe '#user_name' do    
    it 'concats first and last user names' do
      user = FactoryGirl.build(:user, first_name: "foo", last_name: "bar")
      expect(helper.user_name user).to eq("Foo Bar")
    end
  end
end