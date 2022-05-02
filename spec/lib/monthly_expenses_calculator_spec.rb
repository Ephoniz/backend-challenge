require 'monthly_expenses_calculator'
require 'spec_helper'
include MonthlyExpensesCalculator

RSpec.describe MonthlyExpensesCalculator do
    let(:data) { get_csv_data('lib/first_month.csv') }
    
    describe '#format_expenses_data' do
        it 'should get total amounts of data provided' do
            expect(format_expenses_data(data)).to eq({
                transportation: 110,
                meals: 4,
                parking: 35
            })
        end
    end
    
    describe '#calculate_expense' do
        context 'when proper amount provided' do
            it 'should calculate total expense when expense > limit' do
                expect(calculate_expense(110, "TRANSPORTATION")).to eq(12.8)
            end

            it 'should calculate total expense when expense < limit ' do
                expect(calculate_expense(50, "TRANSPORTATION")).to eq(6)
            end

            it 'should calculate total expense when expense == limit ' do
                expect(calculate_expense(100, "TRANSPORTATION")).to eq(12)
            end
        end

        context 'when wrong data provided' do
            it 'throw error when invalid value type' do
                expect{calculate_expense('3', "TRANSPORTATION")}.to raise_error(ArgumentError)
            end

            it 'throw error when negative value' do
                expect{calculate_expense(-3, "TRANSPORTATION")}.to raise_error(ArgumentError)
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

    describe '#get_expense_parameters' do
        it 'should calculate give the right parameters for the given expense' do
            subject = get_expense_parameters("TRANSPORTATION")
            expect(subject).not_to be_empty
            expect(subject["limit"]).to eq(100)
            expect(subject["first_price"]).to eq(0.12)
            expect(subject["second_price"]).to eq(0.08)
        end

        it 'should handle json parser error' do
            expect{ get_expense_parameters("", "bad_json.json") }.to raise_error(JSON::ParserError)
        end
    end
end