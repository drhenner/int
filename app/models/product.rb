class Product < ApplicationRecord
  has_many :order_items

  def available?
    active? && (quantity > 0)
  end

  def purchase!(number_purchased)
    purchase(number_purchased)
    save!
  end

  private

  def purchase(number_purchased)
    self.quantity = self.quantity - number_purchased
  end
end
