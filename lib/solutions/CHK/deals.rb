require_relative 'pricelist'

class Deals
  attr_reader :deal_list, :cross_item_deals
  def initialize
    @prices = Pricelist.new
    @deal_list = [
      {'item' => 'E', 'quantity' => 2, 'bundle_price' => 80, 'bonus_item' => 'B', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'F', 'quantity' => 2, 'bundle_price' => 20, 'bonus_item' => 'F', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'N', 'quantity' => 3, 'bundle_price' => 120, 'bonus_item' => 'M', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'R', 'quantity' => 3, 'bundle_price' => 150, 'bonus_item' => 'Q', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'U', 'quantity' => 3, 'bundle_price' => 120, 'bonus_item' => 'U', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'A', 'quantity' => 5, 'bundle_price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'A', 'quantity' => 3, 'bundle_price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'B', 'quantity' => 2, 'bundle_price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'H', 'quantity' => 10, 'bundle_price' => 80, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'H', 'quantity' => 5, 'bundle_price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'K', 'quantity' => 2, 'bundle_price' => 120, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'P', 'quantity' => 5, 'bundle_price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'Q', 'quantity' => 3, 'bundle_price' => 80, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'V', 'quantity' => 3, 'bundle_price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'V', 'quantity' => 2, 'bundle_price' => 90, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil}
    ]
    calculate_discount_value
    sort_deals_by_discount
    @cross_item_deals = [
      {'items' => ['S','T','X','Y','Z'], 'quantity' => 3, 'bundle_price' => 45}
    ]
  end

  def calculate_discount_value
    @deal_list.each do |deal|
      if deal['bonus_item'].nil?
        deal['discount_value'] = (@prices.pricelist[deal['item']] * deal['quantity']) - deal['bundle_price']
      else
        deal['discount_value'] = (@prices.pricelist[deal['bonus_item']] * deal['bonus_item_quantity'])
      end
    end
  end

  def sort_deals_by_discount
    @deal_list.sort_by! { |deal| deal['discount_value'] }.reverse!
  end
end

