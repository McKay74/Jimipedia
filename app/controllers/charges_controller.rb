class ChargesController < ApplicationController
  def create

  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: 10_00,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
  )

  flash[:success] = "Thanks for purchasing a premium membership #{current_user.email}!"
  redirect_to user_path(current_user)


rescue Stripe::CardError => e 
  flash[:error] = e.message
  redirect_to new_charge_path
end

def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "Premium Membership - #{current_user.name}",
    amount: 10_00
  }
end

end
