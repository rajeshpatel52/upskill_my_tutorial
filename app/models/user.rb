class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :plan

  attr_accessor :stripe_card_token
  # If Pro user passes validations (email, password,etc.),
  # then call Stripe and tell Stripe to set up a subscription
  # upon charging the customer's card.
  # Stripe responds back with customer data.
  # Store customer.id as the customer token and save the user.
  def save_with_subscription
	if valid?

          cus = Stripe::Customer.create(description: email,card: stripe_card_token)
				self.stripe_customer_token = cus.id
				#cus.sources.create(source: stripe_card_token)
				#sub = Stripe::Subscription.create(customer: cus.id, plan: plan_id)
				save!
	    save!
	  end
	end
end

 #customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
 #self.stripe_customer_token = customer.id

      
 