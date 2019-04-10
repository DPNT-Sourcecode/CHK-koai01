# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices:, deals:)
    @prices = prices
    @deals = deals
  end

  def checkout(skus)
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






