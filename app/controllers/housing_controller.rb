class HousingController < ApplicationController

  def index
    @outside_akron_owners_by_state = outside_akron_owners_by_state_data
    @avg_sales_by_year = avg_sales_by_year
    @city_count = Parcel.where(:city_owned => true).count
    @other_count = Parcel.where(:city_owned => false).count

    @use_class_count = use_class_count
  end
  
  
  private
  def avg_sales_by_year
    sales = ParcelSale.select("sales_date, price").where("sales_date > ?", 20.years.ago).each_with_object({}) do |ps, obj|
      obj[ps.sales_date.year]||=[]
      obj[ps.sales_date.year] << ps.price
    end

    avg_sales_by_year = [["Year", "Sales"]]
    sales.keys.sort.each do |year|
      yr_sales = sales[year]
      avg = yr_sales.compact.inject(0) { |sum, el| sum + el } / yr_sales.size
      avg_sales_by_year << ["#{year}", avg]
    end
    avg_sales_by_year
  end

  def outside_akron_owners_by_state_data
    sql = <<-SQL
      SELECT CONCAT('US-',owner_state), COUNT(id) AS owner_count
      FROM parcels
      WHERE owner_state != 'OH' AND owner_state != ''
      GROUP BY owner_state
    SQL
    ActiveRecord::Base.connection.execute(sql).map { |i| i.values }
  end

  def use_class_count
    sql = <<-SQL
    SELECT use_class, COUNT(Id)
    FROM parcels
    GROUP BY use_class
    SQL
    ActiveRecord::Base.connection.execute(sql).map do |i|
      data = i.values
      [LandUseCode::CLASSES_LOOKUP[data.first], data.second]

    end
  end
end