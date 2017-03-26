class LandUseCode < ApplicationRecord
  validates :object_id, presence: true
  validates :value, presence: true
  validates :label, presence: true
end
