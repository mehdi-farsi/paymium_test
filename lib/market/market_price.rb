class Market
  class MarketPrice < ServiceBase
    attr_reader :market

    def initialize(market)
      @market = market
    end

    def call
      return nil if market.bids.empty? || market.asks.empty?

      (market.bids.first.price + market.asks.first.price) / 2
    end
  end
end