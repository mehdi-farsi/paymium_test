require 'rspec'
require_relative './spec_helper'
require 'rspec'
require_relative '../lib/market/market_price'
require_relative '../lib/market'
require_relative '../lib/order'

RSpec.describe Market::MarketPrice do
  let(:market) { Market.new }

  before do
    @buy_order = Order.new(amount: 1, price: 27000, side: 'buy')
    @sell_order = Order.new(amount: 2, price: 28000, side: 'sell')
    Market::SubmitOrder.call(market, @buy_order)
    Market::SubmitOrder.call(market, @sell_order)
  end

  it 'calculates the correct market price based on top bids and asks' do
    market_price = Market::MarketPrice.call(market)
    expect(market_price).to eq(BigDecimal('27500'))
  end

  it 'returns nil if there are no bids or asks' do
    empty_market = Market.new
    market_price = Market::MarketPrice.call(empty_market)
    expect(market_price).to be_nil
  end
end
