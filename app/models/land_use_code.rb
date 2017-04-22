class LandUseCode < ApplicationRecord
  paginates_per 50
  max_paginates_per 100

  validates :object_id, presence: true
  validates :use_code, presence: true
  validates :label, presence: true
  validates :use_class, presence: true
end
