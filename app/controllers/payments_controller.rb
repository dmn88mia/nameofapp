class PaymentsController < ApplicationController
 
  def create
  	@product = Product.find(params[:product_id])
  	@user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
    if charge.paid
      Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
      	)

    end


    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    if charge.paid
      redirect_to thank_you_payment_url
    else 	
      redirect_to product_path(@product)
    end
  end

  def thank_you_payment
  end

  

end
