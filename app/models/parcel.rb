class Parcel < ApplicationRecord
  paginates_per 50
  max_paginates_per 100

  validates :object_id, presence: true
  validates :parcel_id, presence: true

  belongs_to :land_use_code

  has_many :parcel_sales
  has_many :parcel_appraisals
end
