class Market
  class CancelOrder < ServiceBase
    attr_reader :market, :order_id

    def initialize(market, order_id)
      @market = market
      @order_id = order_id
    end

    def call
      market.bids.reject! { |order| order.id == order_id }
      market.asks.reject! { |order| order.id == order_id }
    end
  end
end