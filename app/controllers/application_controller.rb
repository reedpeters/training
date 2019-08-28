class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :load_cart

   def load_cart
     @cart = Cart.new(json: session['cart'])
   end

   def save_cart
     session['cart'] = @cart.to_json
   end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:vet_registration_number])
   end
end
