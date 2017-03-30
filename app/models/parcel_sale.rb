class ParcelSale < ApplicationRecord
  validates :object_id, presence: true
  validates :parcel_id, presence: true
  validates :sales_date, presence: true
  validates :price, numericality: { only_integer: true }, allow_nil: true
  validates :approximate_total, numericality: { only_integer: true }, allow_nil: true

  belongs_to :parcel
end
