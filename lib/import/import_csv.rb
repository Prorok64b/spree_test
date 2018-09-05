class Import::ImportCSV < Import::Import
    
    def self.run(file_path)
        ImportWorker.perform_async(file_path)
    end

    def initialize(file_path)
        @file_path = file_path
    end
    
    def import
        save_tmp_file
        read_tmp_file_as_csv do |row|
            puts row.inspect
        end
        clean
    end

    private
    def read_origin_file
        File.open(@file_path).each do |line|
            yield(line)
        end
    end

    def save_tmp_file
        @tmp_file_path = "#{Rails.root.to_s}/tmp/#{DateTime.now.strftime('%Q')}_import.csv"
        out_file = File.new(@tmp_file_path, "w")
    
        read_origin_file do |row|
            out_file.puts row       
        end
    
        out_file.close
    end

    def read_tmp_file_as_csv
        CSV.foreach(@tmp_file_path, :headers => true, :col_sep => ';') do |row|
            yield(row)
        end
    end

    def clean
        File.delete(@tmp_file_path)
    end
end