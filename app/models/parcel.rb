class Parcel < ApplicationRecord
  validates :object_id, presence: true
  validates :parcel_id, presence: true
  belongs_to :parcel_class
  belongs_to :neighborhood
  belongs_to :land_use_code
  
end
