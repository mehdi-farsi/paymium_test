require 'rspec'
require_relative './spec_helper'

RSpec.describe Order do
  it 'initializes with correct attributes for a buy order' do
    order = Order.new(amount: 1, price: 27000, side: 'buy')

    expect(order.amount).to eq(BigDecimal('1'))
    expect(order.price).to eq(BigDecimal('27000'))
    expect(order.side).to eq('buy')
  end

  it 'initializes with correct attributes for a sell order' do
    order = Order.new(amount: 2, price: 28000, side: 'sell')

    expect(order.amount).to eq(BigDecimal('2'))
    expect(order.price).to eq(BigDecimal('28000'))
    expect(order.side).to eq('sell')
  end

  it 'generates unique IDs for each order' do
    order1 = Order.new(amount: 1, price: 27000, side: 'buy')
    order2 = Order.new(amount: 2, price: 28000, side: 'sell')

    expect(order1.id).not_to eq(order2.id)
  end

  it 'raises an error if side is invalid' do
    expect { Order.new(amount: 1, price: 27000, side: 'hold') }.to raise_error(ArgumentError, "Invalid side: must be 'buy' or 'sell'")
  end
end