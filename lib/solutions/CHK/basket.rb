class Basket
  attr_accessor :items, :cost, :bundles, :individual_items
  def initialize(skus)
    @items = skus.to_s.split('')
    @cost = 0
    @bundles = []
    @individual_items = []
  end
end



