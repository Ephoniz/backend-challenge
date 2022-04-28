require_relative 'monthly_expenses_calculator'

csv_data = get_expenses_data('lib/data.csv')
formated_data = format_expenses_data(csv_data)
p calculate_total_month_expenses(formated_data)