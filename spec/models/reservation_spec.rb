require 'spec_helper'

describe Reservation do

  describe '.current' do
    let!(:time_now)                  { Time.now }
    let!(:beginning_of_current_week) { time_now.beginning_of_week }

    let!(:old_reservation)       {FactoryGirl.create(:reservation, created_at: time_now - 10.days)}
    let!(:current_reservation_1) {FactoryGirl.create(:reservation, created_at: beginning_of_current_week)}
    let!(:current_reservation_2) {FactoryGirl.create(:reservation, created_at: beginning_of_current_week + 2.days)}
    let!(:current_reservation_3) {FactoryGirl.create(:reservation, created_at: beginning_of_current_week + 6.days)}
    let!(:next_reservation)      {FactoryGirl.create(:reservation, created_at: beginning_of_current_week + 7.days)}

    it 'return all reservations of current week' do
      reservations = Reservation.current

      expect(reservations.count).to eq(3)
      reservations.each do |r|
        expect(r.created_at >= Date.today.beginning_of_week && r.created_at < Date.today.beginning_of_week+7.days)
      end
    end
  end
end
