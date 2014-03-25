require "master_importer/csv_importer"

# Master Datas
[M::Amount, M::Origin, M::Prefecture, M::Manufacturer, M::LifeCar, M::Status].each do |model|
    MasterImporter::CSVImporter.new(model).execute
end