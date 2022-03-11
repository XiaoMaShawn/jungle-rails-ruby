module SalesHelper
  def active_sale?
    # Sale.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).any?
    # Sale.active? def in models/sale.rb
    Sale.active.any?
  end
end