require 'monthly_expenses_calculator'
require 'spec_helper'
include MonthlyExpensesCalculator

RSpec.describe MonthlyExpensesCalculator do
    describe '#get_expenses_data' do
        it 'should get the data from a csv file' do
            expect(get_expenses_data('lib/first_month.csv')).not_to be_empty
        end
    end
    
    describe '#format_expenses_data' do
        it 'should get total amounts of data provided' do
            data = get_expenses_data('lib/first_month.csv')
            expect(format_expenses_data(data)).to eq({
                transportation: 110,
                meals: 4,
                parking: 35
            })
        end
    end
    
    describe '#calculate_transportation' do
        context 'when proper amount provided' do
            it 'should calculate total transporation when transportation > 100' do
                expect(calculate_transportation(110)).to eq(12.8)
            end

            it 'should calculate total transporation when transportation < 100 ' do
                expect(calculate_transportation(50)).to eq(6)
            end

            it 'should calculate total transporation when transportation == 100 ' do
                expect(calculate_transportation(100)).to eq(12)
            end
        end

        context 'when wrong data provided' do
            it 'throw error when invalid value type' do
                expect{calculate_transportation('3')}.to raise_error(ArgumentError)
            end

            it 'throw error when negative value' do
                expect{calculate_transportation(-3)}.to raise_error(ArgumentError)
            end
        end
    end

    describe '#calculate_meals' do
        context 'when proper amount provided' do
            it 'should calculate total meals when meals > 3' do
                expect(calculate_meals(4)).to eq(36)
            end

            it 'should calculate total meals when meals < 3' do
                expect(calculate_meals(2)).to eq(20)
            end

            it 'should calculate total meals when meals = 3' do
                expect(calculate_meals(3)).to eq(30)
            end
        end

        context 'when wrong data provided' do
            it 'throw error when invalid value type' do
                expect{calculate_meals('3')}.to raise_error(ArgumentError)
            end

            it 'throw error when negative value' do
                expect{calculate_meals(-3)}.to raise_error(ArgumentError)
            end
        end
    end

    describe '#calculate_parking' do
        context 'when proper amount provided' do
            it 'should calculate total parking when parking > 20' do
                expect(calculate_parking(35)).to eq(27.5)
            end
            it 'should calculate total parking when parking < 20' do
                expect(calculate_parking(35)).to eq(27.5)
            end
            it 'should calculate total parking when parking = 20' do
                expect(calculate_parking(35)).to eq(27.5)
            end
        end
        
        context 'when wrong data provided' do
            it 'throw error when invalid value type' do
                expect{calculate_parking('3')}.to raise_error(ArgumentError)
            end

            it 'throw error when negative value' do
                expect{calculate_parking(-3)}.to raise_error(ArgumentError)
            end
        end
    end

    describe '#calculate_total_month_expenses' do
        it 'should calculate the total amount of expenses' do
            subject = {
                transportation: 110,
                meals: 4,
                parking: 35
            }
            expect(calculate_total_month_expenses(subject)).to eq(76.30)
        end
    end
end