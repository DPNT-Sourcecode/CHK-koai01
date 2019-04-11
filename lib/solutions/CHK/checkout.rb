# noinspection RubyUnusedLocalVariable
require_relative 'basket'
class Checkout
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
    Basket.new(skus)
    return 0 if items.empty?
    bundles = create_bundles(items)
    items.map! { |x| @prices[x] }
    items.each { |x| return -1 if x.nil? }
    return (items + bundles).reduce(:+)
  end

  def create_bundles(items)
    bundles = []

    @deals.each do |deal|
      loop do
        break unless qualify_for_deal(items, deal)
        price_bundle_items(items, deal, bundles)
        price_bonus_items(items, deal, bundles) unless insufficient_bonus_items(items, deal)
      end
    end
    return bundles
  end

  def qualify_for_deal(items, deal)
    items.count(deal['item']) >= deal['quantity']
  end

  def insufficient_bonus_items(items, deal)
    deal['bonus_item'].nil? || items.count(deal['bonus_item']) < deal['bonus_item_quantity']
  end

  def price_bundle_items(items, deal, bundles)
    deal['quantity'].times { items.delete_at(items.index(deal['item'])) }
    bundles << deal['price']
  end

  def price_bonus_items(items, deal, bundles)
    deal['bonus_item_quantity'].times { items.delete_at(items.index(deal['bonus_item']))}
    bundles << deal['bonus_item_price']
  end
end

