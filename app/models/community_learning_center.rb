class CommunityLearningCenter < ApplicationRecord
  validates :school_name, presence: true
  validates :address , presence: true
end
