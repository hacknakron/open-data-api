class LandUseCode < ApplicationRecord
  paginates_per 50
  max_paginates_per 100

  CLASSES = [{use_class: 'A', name: 'Agriculture'},
      {use_class: 'M', name: 'Mineral Rights'},
      {use_class: 'I', name: 'Industrial'},
      {use_class: 'O', name: 'Oil and Gas'},
      {use_class: 'C', name: 'Commercial'},
      {use_class: 'R', name: 'Residential'},
      {use_class: 'E', name: 'Exempt'},
      {use_class: 'P', name: 'Public Utilities'},
      {use_class: 'G', name: 'Oil and Gas interests'},
      {use_class: 'U', name: 'Railroad'}].freeze

  CLASSES_LOOKUP = CLASSES.each_with_object({}){|row, obj| obj[row[:use_class]] = row[:name]}.freeze

  validates :object_id, presence: true
  validates :use_code, presence: true
  validates :label, presence: true
  # validates :use_class, presence: true
end
