# noinspection RubyUnusedLocalVariable
require_relative 'basket'
class Shop
  def initialize
    @prices = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'E' => 40,
      'F' => 10
    }
    @deals = [
      {'item' => 'E', 'quantity' => 2, 'price' => 80, 'bonus_item' => 'B', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'A', 'quantity' => 5, 'price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'A', 'quantity' => 3, 'price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'B', 'quantity' => 2, 'price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'F', 'quantity' => 3, 'price' => 20, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil}
    ]
  end

  def checkout(skus)
    @basket = Basket.new(skus)
    return -1 unless valid_basket
    return 0 if @basket.items.empty?
    price_basket
    return @basket.cost
  end

  def price_basket
    price_bundles
    price_individual_items
    @basket.cost += ((@basket.items + @basket.bundles).reduce(:+))
  end

  def price_bundles
    @deals.each do |deal|
      loop do
        break unless qualify_for_deal(deal)
        price_bundle_items(deal)
        price_bonus_items(deal) unless insufficient_bonus_items(deal)
      end
    end
  end

  def qualify_for_deal(deal)
    @basket.items.count(deal['item']) >= deal['quantity']
  end

  def insufficient_bonus_items(deal)
    deal['bonus_item'].nil? || @basket.items.count(deal['bonus_item']) < deal['bonus_item_quantity']
  end

  def price_bundle_items(deal)
    deal['quantity'].times { @basket.items.delete_at(@basket.items.index(deal['item'])) }
    @basket.bundles << deal['price']
  end

  def price_bonus_items(deal)
    deal['bonus_item_quantity'].times { @basket.items.delete_at(@basket.items.index(deal['bonus_item']))}
    @basket.bundles << deal['bonus_item_price']
  end

  def price_individual_items
    @basket.items.map! { |x| @prices[x] }
  end

  def valid_basket
    @basket.items.each { |x| return false unless @prices.key?(x) }
  end
end
