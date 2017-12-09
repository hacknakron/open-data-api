namespace :data do
  task :import => :environment do
    DataImporter.new.import_all
  end
  task :sample => :environment do
    DataImporter.new.import_all
  end
end