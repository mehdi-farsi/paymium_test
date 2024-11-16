require 'rspec'
require_relative './spec_helper'

RSpec.describe Market::CancelOrder do
  let(:market) { Market.new }
  let(:order) { Order.new(amount: 1, price: 27000, side: 'buy') }

  it 'cancels an existing order from the market' do
    Market::SubmitOrder.call(market, order)
    expect { Market::CancelOrder.call(market, order.id) }.to change { market.bids.count }.by(-1)
  end

  it 'does not cancel a non-existing order' do
    expect { Market::CancelOrder.call(market, 999) }.not_to change { market.bids.count }
    expect { Market::CancelOrder.call(market, 999) }.not_to change { market.asks.count }
  end
end