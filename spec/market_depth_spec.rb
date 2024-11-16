require 'rspec'
require_relative './spec_helper'

RSpec.describe Market::MarketDepth do
  let(:market) { Market.new }

  before do
    @buy_order = Order.new(amount: 1, price: 27000, side: 'buy')
    @sell_order = Order.new(amount: 2, price: 28000, side: 'sell')
    Market::SubmitOrder.call(market, @buy_order)
    Market::SubmitOrder.call(market, @sell_order)
  end

  it 'returns the correct market depth for bids and asks' do
    depth = Market::MarketDepth.call(market)
    expect(depth['bids']).to eq([['27000.00', '1.00000000']])
    expect(depth['asks']).to eq([['28000.00', '2.00000000']])
  end

  it 'includes the base and quote currency in the market depth' do
    depth = Market::MarketDepth.call(market)
    expect(depth['base']).to eq('BTC')
    expect(depth['quote']).to eq('EUR')
  end
end