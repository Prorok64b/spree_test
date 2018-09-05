class Spree::FilesController < ApplicationController
    def index
    
    end

    def upload_csv
        ImportCSV.new(file_path)

    end

    private
    def file_path
        params['file_csv']&.original_filename
    end
end