# == Schema Information
#
# Table name: fx_rates
#
#  id         :integer          not null, primary key
#  text       :string(16384)
#  created_at :datetime
#  updated_at :datetime
#  date       :date
#

require "open-uri"

class FXRate < ActiveRecord::Base
  def self.convert(date: Date.today, to_currency: nil, amount: 0)
    fx_rate = FXRate.where(date: date).last 

    unless fx_rate
      yyyy_mm_dd = date.strftime('%Y-%m-%d')
      app_id = Rails.application.secrets.open_exchange_rate_app_id
      response = open("http://openexchangerates.org/historical/#{yyyy_mm_dd}.json?app_id=#{app_id}").read
   
      fx_rate = FXRate.create(date: date, text: response)
    end

    rates = JSON.parse(fx_rate.text)['rates']

    Money.new(rates[to_currency.upcase]*amount.fractional, to_currency)
  end
end
