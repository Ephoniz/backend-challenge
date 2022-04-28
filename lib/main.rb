require_relative 'monthly_expenses_calculator'
include MonthlyExpensesCalculator

months = ['lib/first_month.csv', 'lib/second_month.csv']

months.each do |month|
    csv_data = get_expenses_data(month)
    formated_data = format_expenses_data(csv_data)
    total = calculate_total_month_expenses(formated_data)
    
    draw_expenses_result(csv_data, total)
    puts "\n"
end



