class OrderItem < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
