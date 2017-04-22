class ParcelAppraisal < ApplicationRecord
  paginates_per 50
  max_paginates_per 100
  
  validates :object_id, presence: true
  validates :parcel_id, presence: true
  validates :land_value, presence: true, numericality: { only_integer: true }
  validates :building_value, presence: true, numericality: { only_integer: true }

  belongs_to :parcel
end
