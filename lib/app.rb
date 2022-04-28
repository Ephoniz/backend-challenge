require_relative 'monthly_expenses_calculator'
include MonthlyExpensesCalculator

months = ['lib/first_month.csv', 'lib/second_month.csv']

def draw_expenses_result(expenses, total_expenses)
    puts 'Concept           | Units'
    puts '------------------------------'

    expenses.each do |expense|
        case expense[0]
        when 'TRANSPORTATION'
            puts "#{expense[0]}    | #{expense[1]}"
        when 'MEAL'
            puts "#{expense[0]}              | #{expense[1]}"
        when 'PARKING'
            puts "#{expense[0]}           | #{expense[1]}"
        end
    end
    puts '------------------------------'
    puts "Total             | #{total_expenses}"
end

months.each do |month|
    csv_data = get_expenses_data(month)
    formated_data = format_expenses_data(csv_data)
    total = calculate_total_month_expenses(formated_data)
    
    draw_expenses_result(csv_data, total)
    puts "\n"
end



