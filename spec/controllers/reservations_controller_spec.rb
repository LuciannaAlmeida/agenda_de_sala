require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ReservationsController do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in :user, @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Reservation. As you add validations to Reservation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { user_id: @user_id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReservationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all reservations as @reservations" do
      reservation = Reservation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:reservations)).to eq([reservation])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reservation" do
        expect {
          post :create, {:reservation => valid_attributes}, valid_session
        }.to change(Reservation, :count).by(1)
      end

      it "assigns a newly created reservation as @reservation" do
        post :create, {:reservation => valid_attributes}, valid_session
        expect(assigns(:reservation)).to be_a(Reservation)
        expect(assigns(:reservation)).to be_persisted
      end

      it "redirects to the created reservation" do
        post :create, {:reservation => valid_attributes}, valid_session
        expect(response).to redirect_to(reservations_path)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reservation" do
      reservation = Reservation.create! valid_attributes
      expect {
        delete :destroy, {:id => reservation.to_param}, valid_session
      }.to change(Reservation, :count).by(-1)
    end

    it "redirects to the reservations list" do
      reservation = Reservation.create! valid_attributes
      delete :destroy, {:id => reservation.to_param}, valid_session
      expect(response).to redirect_to(reservations_url)
    end
  end

end
