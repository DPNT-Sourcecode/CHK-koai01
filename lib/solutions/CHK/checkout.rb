# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @prices = {
      'A' => 50,
      'B' => 30,
      'C' => 20,
      'D' => 15
    }
    @deals = [
      {'item' => 'A', 'quantity' => 3, 'price' => 130},
      {'item' => 'B', 'quantity' => 2, 'price' => 45}
    ]
  end

  def checkout(skus)
    return -1 if skus.empty?
    items = skus.to_s.split('')
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
      end
    end

    return bundles
  end

end








