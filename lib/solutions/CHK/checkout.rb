# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @prices = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15,
      'E' => 40
    }
    @deals = [
      {'item' => 'E', 'quantity' => 2, 'price' => 80, 'bonus_item' => 'B', 'bonus_item_quantity' => 1, 'bonus_item_price' => 0},
      {'item' => 'A', 'quantity' => 5, 'price' => 200, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'A', 'quantity' => 3, 'price' => 130, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil},
      {'item' => 'B', 'quantity' => 2, 'price' => 45, 'bonus_item' => nil, 'bonus_item_quantity' => nil, 'bonus_item_price' => nil}
    ]
  end

  def checkout(skus)
    items = skus.to_s.split('')
    p items
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
        deal['quantity'].times { items.delete_at(items.index(deal['item'])) }
        bundles << deal['price']

        unless deal['bonus_item'].nil? || items.count(deal['bonus_item']) < deal['bonus_item_quantity']
          deal['bonus_item_quantity'].times { items.delete_at(items.index(deal['bonus_item']))}
          bundles << deal['bonus_item_price']
        end
      end
    end
    return bundles
  end

  def qualify_for_deal(items, deal)
    items.count(deal['item']) >= deal['quantity']
  end
end


