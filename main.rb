require_relative 'lib/market.rb'

def market
  @market ||= Market.new
end