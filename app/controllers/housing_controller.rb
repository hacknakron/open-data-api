class HousingController < ApplicationController
  
  def index
    @housing_data = 'Views/housing/index.html.erb data'
    @outside_akron_owners_by_state = outside_akron_owners_by_state_data
    @city_count = Parcel.where(:city_owned => true).count
    @other_count = Parcel.where(:city_owned => false).count
  end
  
  
  private
  def outside_akron_owners_by_state_data
    sql = <<-SQL
      SELECT owner_state, COUNT(id) AS owner_count
      FROM parcels
      WHERE owner_city != 'AKRON' AND owner_city != ''
      GROUP BY owner_state, owner_city
    SQL
    ActiveRecord::Base.connection.execute(sql).map { |i| i.values }
  end
  
end
