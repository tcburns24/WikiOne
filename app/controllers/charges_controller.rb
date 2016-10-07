class ChargesController < ApplicationController
  before_action :check_for_premium

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
<<<<<<< HEAD
      amount: 1999,
=======
      amount: 75,
>>>>>>> master
      description: "Premium WikiOne Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.add_role :premium
    flash[:notice] = "Congratulations on becoming a Premium WikiOne-er"
    redirect_to profile_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
  end

  private

  def check_for_premium
    if current_user.is_premium?
      flash[:notice] = "You're already a premium member, no need to pay"
      redirect_to profile_path
    end
  end

end
