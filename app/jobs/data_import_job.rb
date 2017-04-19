class DataImportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    DataImporter.new.import_all
  end
end
