# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
  end

  def checkout(skus)
    items = skus.to_s.split('')
    create_bundles(items)
    items.map! { |x| @prices[x] }
    items.each { |x| return -1 if x.nil? }
    return items.reduce(:+)
  end

  def create_bundles(items)
    p items.count('A') >= 3
  end

end

