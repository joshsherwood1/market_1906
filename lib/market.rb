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
end
