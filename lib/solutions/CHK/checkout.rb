# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
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
    loop do
      break if items.count('A') < 3
      3.times { items.delete_at(items.index('A')) }
      bundles << 130
    end
    return bundles
  end

end



