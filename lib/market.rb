require_relative './order.rb'
require_relative './service_base.rb'
Dir[File.expand_path('lib/**/*.rb')].sort.each { |file| require file } # require service objects

class Market
  attr_reader :bids, :asks, :base_currency, :quote_currency

  def initialize(base_currency: 'BTC', quote_currency: 'EUR')
    @bids = []
    @asks = []
    @base_currency = base_currency
    @quote_currency = quote_currency
  end

  def submit(order)
    Market::SubmitOrder.call(self, order)
  end

  def cancel(order_id)
    Market::CancelOrder.call(self, order_id)
  end

  def market_depth
    Market::MarketDepth.call(self)
  end

  def market_price
    Market::MarketPrice.call(self)
  end
end
