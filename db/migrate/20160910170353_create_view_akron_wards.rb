class CreateViewAkronWards < ActiveRecord::Migration[5.0]


  def up
    execute <<-SQL

    CREATE TABLE IF NOT EXISTS view_akron_wards
    (WardObjectID            Integer
     ,WardNumber            Integer
     ,WardName    Varchar(7)
     ,WardCode            Varchar(3)
     ,TotalPopulation    Integer
     ,DeviationFromAverage    Integer
     ,DeviationFromAveragePercent Decimal(7,5)
     ,WhitePopulation Integer
     ,WhitePopulationPercent Decimal(7,5)
     ,BlackPopulation Integer
     ,BlackPopulationPercent Decimal(7,5)
     ,HispanicPopulation Integer
     ,HispanicPopulationPercent Decimal(7,5)
     ,CouncilPerson Varchar(50)
     ,CouncilPersonWebLink Varchar(100)
     ,WardGlobalID UUID
     ,WardShape_STArea Decimal(13,2)
     ,WardShape_STLength Decimal(13,2)
     ,PRIMARY KEY (WardObjectID));

    SQL
  end

  def down
    drop_table :view_akron_wards
  end

end

