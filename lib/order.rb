require 'bigdecimal'

class Order
  attr_reader :id, :amount, :price, :side

  POSSIBLE_SIDES = %w[buy sell].freeze

  @@id_counter = 0

  def initialize(amount:, price:, side:)
    @id = next_id
    @amount = BigDecimal(amount.to_s)
    @price = BigDecimal(price.to_s)

    raise ArgumentError, "Invalid side: must be 'buy' or 'sell'" unless POSSIBLE_SIDES.include?(side)

    @side = side
  end

  private

  def next_id
    @@id_counter += 1
  end
end