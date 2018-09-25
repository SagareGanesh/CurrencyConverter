class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  include HTTParty

  def show
  end
end
