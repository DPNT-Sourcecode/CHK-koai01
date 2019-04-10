# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
  end

  def checkout(skus)
    return -1 if @prices[skus].nil?
    @prices[skus]
  end

end



