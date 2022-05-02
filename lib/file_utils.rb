require 'csv'

module FileUtils
    def open_file(file_path)
        begin
            File.open(file_path)
        rescue Errno::ENOENT => e
            raise IOError, "Can't process file: #{e.to_s}"
        end
    end
    
    def get_csv_data(csv_directory)
        file = open_file(csv_directory)
        CSV.parse(file, liberal_parsing: true, headers: :first_row)
    end
end