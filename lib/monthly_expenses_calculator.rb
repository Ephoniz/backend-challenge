require 'csv'


    def get_expenses_data(csv_directory)
      CSV.parse(File.read(csv_directory))
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
                total_expenses_amount[:transportation] += expense[1].to_i
            when 'MEAL'
                total_expenses_amount[:meals] += expense[1].to_i
            when 'PARKING'
                total_expenses_amount[:parking] += expense[1].to_i
            end
        end
    
        return total_expenses_amount
    end
    
    def calculate_transportation(transportation)
        raise ArgumentError if  transportation < 0
        return transportation * 0.12 if transportation <= 100
        
        transportation -= 100
        return 12 + (transportation * 0.08)
    end
    
    def calculate_meals(meals)
        raise ArgumentError if  meals < 0
        return meals * 10 if meals <= 3
    
        meals -= 3
        return 30 + (meals * 6)
    end
    
    def calculate_parking(parking)
        raise ArgumentError if  parking < 0
        return parking if parking <= 20
    
        parking -= 20
        return 20 + (parking.to_f / 2)
    end
    
    def calculate_total_month_expenses(month_expenses)
        total = 0.00
        total += calculate_transportation(month_expenses[:transportation])
        total += calculate_meals(month_expenses[:meals])
        total += calculate_parking(month_expenses[:parking])
    
        total
    end

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





