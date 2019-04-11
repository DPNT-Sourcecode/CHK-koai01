# noinspection RubyUnusedLocalVariable
require_relative 'basket'
require_relative 'pricelist'
require_relative 'deals'

class Checkout
  def initialize
    @prices = Pricelist.new
    @deals = Deals.new
  end

  def checkout(skus)
    @basket = Basket.new(skus)
    return -1 unless valid_basket
    return 0 if @basket.items.empty?
    price_basket
    return @basket.cost
  end

  def price_basket
    price_multi_item_bundles
    price_bundles
    price_individual_items
    @basket.cost += (@basket.items.reduce(:+)) unless @basket.items.empty?
    @basket.cost += (@basket.bundles.reduce(:+)) unless @basket.bundles.empty?
  end

  def price_bundles
    @deals.deal_list.each do |deal|
      loop do
        break unless qualify_for_deal(deal)
        price_bundle_items(deal)
        price_bonus_items(deal) unless insufficient_bonus_items(deal)
      end
    end
  end

  def qualify_for_deal(deal)
    if deal['bonus_item'].nil?
      (@basket.items.count(deal['item']) >= deal['quantity'])
    else
      (@basket.items.count(deal['item']) >= deal['quantity']) && (@basket.items.count(deal['bonus_item']) >= deal['bonus_item_quantity'])
    end
  end

  def insufficient_bonus_items(deal)
    deal['bonus_item'].nil? || @basket.items.count(deal['bonus_item']) < deal['bonus_item_quantity']
  end

  def price_bundle_items(deal)
    deal['quantity'].times { @basket.items.delete_at(@basket.items.index(deal['item'])) }
    @basket.bundles << deal['bundle_price']
  end

  def price_bonus_items(deal)
    deal['bonus_item_quantity'].times { @basket.items.delete_at(@basket.items.index(deal['bonus_item']))}
    @basket.bundles << deal['bonus_item_price']
  end

  def price_individual_items
    @basket.items.map! { |x| @prices.pricelist[x] }
  end

  def price_multi_item_bundles
    separate_cross_bundle_items
    @basket.cross_item_bundles.sort_by! { |item| @prices.pricelist[item] }.reverse!
    loop do
      break if @basket.cross_item_bundles.length < @deals.cross_item_deals[0]['quantity']
      @deals.cross_item_deals[0]['quantity'].times { @basket.cross_item_bundles.delete_at(0) }
      @basket.cost += @deals.cross_item_deals[0]['bundle_price']
    end
    @basket.items.concat(@basket.cross_item_bundles)
  end

  def separate_cross_bundle_items
    @deals.cross_item_deals[0]['items'].each do |item|
      if @basket.items.include?(item)
        @basket.items.count(item).times { @basket.cross_item_bundles << item }
        @basket.items.delete(item)
      end
    end
  end

  def valid_basket
    @basket.items.each { |x| return false unless @prices.pricelist.key?(x) }
  end
end

