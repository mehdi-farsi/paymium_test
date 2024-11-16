require 'rspec'
require_relative './spec_helper'

RSpec.describe Market::SubmitOrder do
  let(:market) { Market.new }
  let(:order) { Order.new(amount: 1, price: 27000, side: 'buy') }

  it 'submits a buy order to the market' do
    expect { Market::SubmitOrder.call(market, order) }.to change { market.bids.count }.by(1)
  end
end