# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize(prices)
    @prices = prices
  end

  def checkout(skus)
    # if skus == 'A'
    #   return 50
    # else
    #   return 30
    # end

    return @prices[skus]
  end

end


