# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
  end

  def checkout(skus)
    # return -1 if @prices[skus].nil?
    # @prices[skus]

    # skus.split('').each { return -1 if @prices[skus].nil? }

    items_array = skus.split('')
    p items_array
    items_array.map! { |x| @prices[x] }
    p items_array
    items_array.each { |x| return -1 if x.nil? }
    p items_array
    return items_array.reduce(:+)
  end

end




