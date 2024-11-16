class Market
  class MarketDepth < ServiceBase
    attr_reader :market

    def initialize(market)
      @market = market
    end

    def call
      {
        "bids" => market.bids.map { |o| [format('%.2f', o.price), format('%.8f', o.amount)] },
        "asks" => market.asks.map { |o| [format('%.2f', o.price), format('%.8f', o.amount)] },
        "base" => market.base_currency,
        "quote" => market.quote_currency
      }
    end
  end
end