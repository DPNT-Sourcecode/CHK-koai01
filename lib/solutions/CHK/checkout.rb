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
      {'item' => 'A', 'quantity' => 5, 'price' => 200},
      {'item' => 'A', 'quantity' => 3, 'price' => 130},
      {'item' => 'B', 'quantity' => 2, 'price' => 45}
    ]
  end

  def checkout(skus)
    items = skus.to_s.split('')
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
        break if items.count(deal['item']) < deal['quantity']
        deal['quantity'].times { items.delete_at(items.index(deal['item'])) }
        bundles << deal['price']
        if deal['item'] == 'E' && items.include?('B')
          items.delete_at(items.index(deal['B']))
          bundles << 0
        end
      end
    end

    return bundles
  end

end



