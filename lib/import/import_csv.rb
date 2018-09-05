class Import::ImportCSV < Import::Iimport

    def initialize(file_path)
        @file_path = file_path
    end

    def run
        UploadWorker.perform_async(@file_path)
    end

    private
    def import(file_path)
        read_file(file_path) do |line|
            
        end
    end

    def read_file(file_path)
        File.readlines(@file_path).each do |line|
            yield(line)
        end
    end
end