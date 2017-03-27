class Parcel < ApplicationRecord
  validates :object_id, presence: true
  validates :parcel_id, presence: true

end
