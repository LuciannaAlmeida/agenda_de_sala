require 'spec_helper'

describe "Reservations" do
  before :each do
    @user = FactoryGirl.create(:user)
    visit reservations_path
    fill_in "Email", with: @user.email
    fill_in "Senha", with: @user.password
    click_button "Login"
  end

  describe "GET /reservations" do
    it "is under reservations_path" do
      visit reservations_path
      expect(current_path).to eq(reservations_path)
    end

    it "lists all current reservations" do
      # current_reservation of current user
      FactoryGirl.create(:reservation, hour: '07:00', day: 'Thu', user: @user, created_at: Time.now)
      # current_reservation NOT of current user
      FactoryGirl.create(:reservation, hour: '22:00', day: 'Fri', created_at: Time.now)
      # old reservation that must not be on the reservations#index view
      FactoryGirl.create(:reservation, hour: '06:00', day: 'Mon', created_at: (Time.now - 10.days))

      visit reservations_path

      expect(page.has_css?("a#reserved-0700-Thu")).to eq(true)
      expect(page.has_css?("span#reserved-2200-Fri")).to eq(true)
      expect(page.has_css?("a#available-0600-Mon")).to eq(true)
    end
  end

  describe "POST /reservations" do
    it "creates a new reservation and changes the available link to the reserved one" do
      previews_reservation_amount = Reservation.count
      visit reservations_path
      find('div#window-0700-Tue').click_link('Disponivel')

      expect(page.has_css?("a#reserved-0700-Tue")).to eq(true)

      expect(Reservation.count).to eq(previews_reservation_amount + 1)
      reservation = Reservation.last
      expect(reservation.user_id).to eq(@user.id)
      expect(reservation.hour).to eq('07:00')
      expect(reservation.day).to eq('Tue')
    end
  end

  describe "DELETE /reservations" do
    it "deletes the reservation and changes the reserved link to the available one" do
      FactoryGirl.create(:reservation, user: @user, hour: '21:00', day: 'Wed')
      previews_reservation_amount = Reservation.count
      visit reservations_path

      expect(page.has_css?("a#reserved-2100-Wed")).to eq(true)

      find('div#window-2100-Wed').click_link("Reservado para #{@user.first_name.capitalize}")

      expect(page.has_css?("a#available-2100-Wed")).to eq(true)
      expect(Reservation.count).to eq(previews_reservation_amount - 1)
    end
  end
end
