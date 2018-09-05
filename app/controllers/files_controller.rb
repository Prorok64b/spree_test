class Spree::FilesController < ApplicationController
    def index
    end

    def upload_product_csv
        return redirect_to :index unless file_path
        Import::ImportCSV.run(file_path)
    end

    private
    def file_path
        params['file_csv']&.original_filename
    end
end