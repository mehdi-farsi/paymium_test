require 'rspec'
require_relative './spec_helper'

RSpec.describe Market do
  let(:market) { Market.new }
  let(:order) { Order.new(amount: 1, price: 27000, side: 'buy') }

  it 'submits a buy order using service object' do
    expect { market.submit(order) }.to change { market.bids.count }.by(1)
  end

  it 'cancels an order using service object' do
    market.submit(order)
    expect { market.cancel(order.id) }.to change { market.bids.count }.by(-1)
  end

  it 'displays market depth using service object' do
    market.submit(order)
    depth = market.market_depth
    expect(depth["bids"]).to eq([['27000.00', '1.00000000']])
  end

  it 'calculates market price using service object' do
    sell_order = Order.new(amount: 1, price: 28000, side: 'sell')
    market.submit(order)
    market.submit(sell_order)
    expect(market.market_price).to eq(BigDecimal('27500'))
  end
end