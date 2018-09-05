class ImportWorker
  include Sidekiq::Worker

  def perform(file_path)
    csv = Import::ImportCSV.new(file_path)
    csv.import
  end
end
