class WelcomeController < ApplicationController
  def landing
    redirect_to user_root_path if user_signed_in?
  end
end
