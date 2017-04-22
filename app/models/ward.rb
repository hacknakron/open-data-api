class Ward < ApplicationRecord
  paginates_per 50
  max_paginates_per 100
  
  validates :district_id, presence: true, numericality: { only_integer: true }
  validates :distract_name, presence: true
  validates :ward_id, presence: true
  validates :total_population, presence: true, numericality: true
  validates :dx_dev, presence: true, numericality: true
  validates :total_dvp, presence: true, numericality: true
  validates :white_population, presence: true, numericality: true
  validates :black_population, presence: true, numericality: true
  validates :hispanic_population, presence: true, numericality: true
  validates :council_person, presence: true
  validates :web_link, presence: true
  validates :global_id, presence: true
  validates :shape_st_area, presence: true
  validates :shape_st_length, presence: true
end
