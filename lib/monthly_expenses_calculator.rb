require 'csv'

def get_expenses_data(csv_directory)
  CSV.parse(File.read(csv_directory))
end

def calculate_total_expenses_amounts(expenses)
    total_expenses_amount = {
        transportation: 0,
        meals: 0,
        parking: 0
    }

    expenses.each do |expense|
        case expense[0]
        when 'TRANSPORTATION'
            total_expenses_amount[:transportation] += expense[1].to_i
        when 'MEAL'
            total_expenses_amount[:meals] += expense[1].to_i
        when 'PARKING'
            total_expenses_amount[:parking] += expense[1].to_i
        end
    end

    return total_expenses_amount
end


