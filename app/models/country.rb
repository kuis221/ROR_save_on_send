class Country < ActiveRecord::Base
  def receive_currency
    if receive_only_local_currency?
      [currency_code].compact
    else
      [Money.default_currency.iso_code, currency_code].compact
    end
  end

  private
  def receive_only_local_currency?
    # FIXME would be good to have receive only local currency as flag in db
    ['MXN', 'INR'].include?(currency_code)
  end
end
