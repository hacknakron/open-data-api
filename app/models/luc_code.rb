class LucCode < ApplicationRecord
  validates :object_id, presence: true
  validates :value, presence: true
  validates :message, presence: true
end
