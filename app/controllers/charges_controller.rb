class ChargesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:create]

    def new
    end
    
    def create
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @listing.price,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private

    def set_listing
        @listing = Listing.find(params[:listing_id])
    end
end
