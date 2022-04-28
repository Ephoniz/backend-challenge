require 'csv'

def get_expenses_data(csv_directory)
  CSV.parse(File.read(csv_directory))
end




