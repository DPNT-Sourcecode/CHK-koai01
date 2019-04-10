# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
  end

  def checkout(skus)
    items_array = skus.to_s.split('')
    items_array.map! { |x| @prices[x] }
    items_array.each { |x| return -1 if x.nil? }
    return items_array.reduce(:+)
  end

end
