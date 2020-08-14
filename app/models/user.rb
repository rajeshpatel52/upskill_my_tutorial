class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :plan

  attr_accessor :stripe_card_token
  def save_with_subscription
	if valid?
		  customer.subscription = Stripe::Subscription.create(customer: customer_name, email: email, card: stripe_card_token)
          #subscription = Stripe::Subscription.create(name: customer_name, email: email)
          self.stripe_customer_token = customer.subscription.id
	  
	    save!
	  end
	end
end


#customer = Stripe::Subscription.create(customer: 'cus_HUygIwZc2oRl6b', items: [{price: 'price_1GvyFkF9qQeqyuU6eql4MMUE'}], card: stripe_card_token)
      
 #     self.stripe_customer_token = customer.id