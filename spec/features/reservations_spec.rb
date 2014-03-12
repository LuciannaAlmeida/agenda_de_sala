require 'spec_helper'

describe "Reservations" do
  describe "GET /reservations" do
    before :each do 
      user = FactoryGirl.create(:user)
      visit reservations_path
      fill_in "Email", with: user.email
      fill_in "Senha", with: user.password
      click_button "Sign in"
    end
    
    it "works! (now write some real specs)" do
      visit reservations_path
      expect(current_path).to eq(reservations_path)
    end
  end
end
