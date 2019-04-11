class Basket
  attr_accessor :items, :cost, :bundles, :individual_items, :cross_item_bundles
  def initialize(skus)
    @items = skus.to_s.split('')
    @cost = 0
    @bundles = []
    @cross_item_bundles = []
    @individual_items = []
  end

end


