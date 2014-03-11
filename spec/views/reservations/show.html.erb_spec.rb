require 'spec_helper'

describe "reservations/show" do
  before(:each) do
    @reservation = assign(:reservation, stub_model(Reservation))
  end

  it "renders attributes in <p>" do
    render
  end
end
