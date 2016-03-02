if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_YbQO0eLxu3S77w3qnGkZagFg',
    :secret_key => 'sk_test_pR22QxUQ7nX8Umk40jduMoC9'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]