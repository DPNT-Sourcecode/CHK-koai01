require_relative 'pricelist'

class Deals
  attr_reader :deal_list
  def initialize
    @prices = Pricelist.new
    @deal_list = [
      {'item' => 'E', 'quantity' => 2, 'bundle_price' => 80, 'bonus_item' => 'B', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0, 'discount_value' => lambda { (@prices.pricelist[:bonus_item]*:bonus_item_quantity)} },
      {'item' => 'F', 'quantity' => 2, 'bundle_price' => 20, 'bonus_item' => 'F', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0, 'discount_value' => lambda { (@prices.pricelist[:bonus_item]*:bonus_item_quantity)} },
      {'item' => 'N', 'quantity' => 3, 'bundle_price' => 120, 'bonus_item' => 'M', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0, 'discount_value' => lambda { (@prices.pricelist[:bonus_item]*:bonus_item_quantity)} },
      {'item' => 'R', 'quantity' => 3, 'bundle_price' => 150, 'bonus_item' => 'Q', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0, 'discount_value' => lambda { (@prices.pricelist[:bonus_item]*:bonus_item_quantity)} },
      {'item' => 'U', 'quantity' => 3, 'bundle_price' => 120, 'bonus_item' => 'U', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0, 'discount_value' => lambda { (@prices.pricelist[:bonus_item]*:bonus_item_quantity)} },
      {'item' => 'A', 'quantity' => 5, 'bundle_price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'A', 'quantity' => 3, 'bundle_price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'B', 'quantity' => 2, 'bundle_price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'H', 'quantity' => 10, 'bundle_price' => 80, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'H', 'quantity' => 5, 'bundle_price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'K', 'quantity' => 2, 'bundle_price' => 150, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'P', 'quantity' => 5, 'bundle_price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'Q', 'quantity' => 3, 'bundle_price' => 80, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'V', 'quantity' => 3, 'bundle_price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'V', 'quantity' => 2, 'bundle_price' => 90, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil}
    ]
  end
end
