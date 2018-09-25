class DashboardController < ApplicationController
  include HTTParty

  def show
    respond_to do |format|
      format.html
      format.json{ render json: convert_currency(currency_params) }
    end
  end

  private

  def currency_params
    params.require(:currency).permit!
  end

  def convert_currency(currency_params)
    from_currency = currency_params[:from_currency]
    to_currency   = currency_params[:to_currency]
    from_value    = currency_params[:from_value]

    exchange_rate = get_exchage_rate(from_currency, to_currency)
    { result: exchange_rate * from_value }.to_json
  end

  def get_exchage_rate(from_currency, to_currency)
    HTTParty.get("https://api.exchangeratesapi.io/latest?base=#{from_currency}&symbols=#{to_currency}")['rates'][to_currency]
  end
end
