class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    all_vendor_names = []
    @vendors.each do |vendor|
      all_vendor_names << vendor.name
    end
    all_vendor_names
  end

  def vendors_that_sell(item)
    vendors_that_sell_item = []
    @vendors.each do |vendor|
      vendors_that_sell_item << vendor if vendor.inventory.has_key?(item)
    end
    vendors_that_sell_item
  end

  def total_inventory
    all_items_and_their_count_hash = Hash.new(0)
    @vendors.map do |vendor|
      vendor.inventory.each do |key, value|
        all_items_and_their_count_hash[key] += value
      end
    end
    all_items_and_their_count_hash
  end

  def sorted_item_list
    total_inventory.keys.sort {|a, b| a <=> b}
  end

  def sell(item, quantity)
    if total_inventory.has_key?(item) && total_inventory[item] >= quantity
      @vendors.each do |vendor|
        vendor.inventory[item] -= quantity until vendor.inventory[item] == 0
      end
      return true
    else
      return false
    end
  end
end
