class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include UsersHelper
  include CartsHelper

  def current_order
    session[:cart] ||= []
  end
end
