require 'json'

module MonthlyExpensesCalculator
    EXPENSES_PARAMETERS_JSON = "./expenses_values.json"

    def calculate_total_month_expenses(month_expenses)
        total = 0.00
        total += calculate_expense(month_expenses[:transportation], "TRANSPORTATION")
        total += calculate_expense(month_expenses[:meals], "MEALS")
        total += calculate_expense(month_expenses[:parking], "PARKING")
    end

    def format_expenses_data(expenses)
        total_expenses_amount = {
            transportation: 0,
            meals: 0,
            parking: 0
        }

        expenses.each do |expense|
            case expense[0]
            when 'TRANSPORTATION'
                total_expenses_amount[:transportation] += expense[1].to_f
            when 'MEAL'
                total_expenses_amount[:meals] += expense[1].to_f
            when 'PARKING'
                total_expenses_amount[:parking] += expense[1].to_f
            end
        end

        return total_expenses_amount
    end

    private

    def calculate_expense(expense, expense_name)
        e = get_expense_parameters(expense_name)
        raise ArgumentError if expense < 0
        return expense * e["first_price"] if expense <= e["limit"]

        expense -= e["limit"]
        (e["limit"] * e["first_price"]) + (expense * e["second_price"])
    end

    def get_expense_parameters(expense, expense_json = EXPENSES_PARAMETERS_JSON)
        file = open_file(expense_json)

        begin
            expenses_parameters = JSON.load file
            expenses_parameters[expense]
        rescue JSON::ParserError => e
            raise JSON::ParserError, "Can't process json file: #{e.to_s}"
        end
    end
end





