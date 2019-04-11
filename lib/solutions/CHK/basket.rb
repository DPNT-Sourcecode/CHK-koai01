class Basket
  def initialize(skus)
    @items = skus.to_s.split('')
    @cost = 0
    @bundles = []
    @individual_items = []
  end
end


