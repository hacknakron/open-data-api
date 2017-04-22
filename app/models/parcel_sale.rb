class ParcelSale < ApplicationRecord
  paginates_per 50
  max_paginates_per 100
  
  validates :object_id, presence: true
  validates :parcel_id, presence: true
  validates :sales_date, presence: true
  validates :price, numericality: { only_integer: true }, allow_nil: true
  validates :approximate_total, numericality: { only_integer: true }, allow_nil: true

  belongs_to :parcel
end
