class Market
  class SubmitOrder < ServiceBase
    attr_reader :market, :order

    def initialize(market, order)
      @market = market
      @order = order
    end

    def call
      if order.side == 'buy'
        market.bids << order
        market.bids.sort_by! { |o| -o.price }
      elsif order.side == 'sell'
        market.asks << order
        market.asks.sort_by! { |o| o.price }
      end
      order.id
    end
  end
end