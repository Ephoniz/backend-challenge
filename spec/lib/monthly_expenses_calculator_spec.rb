require 'monthly_expenses_calculator'
require 'spec_helper'

describe 'monthly_expenses_calculator' do
    it 'should get the data from a csv file' do
        expect(get_expenses_data('lib/data.csv')).not_to be_empty
    end

    it 'should get total amounts of data provided' do
        data = get_expenses_data('lib/data.csv')
        expect(calculate_total_expenses_amounts(data)).to eq({
            transportation: 110,
            meals: 4,
            parking: 35
        })
    end

    it 'should properly calculate total transportation expenses' do
        expect(calculate_transportation(110)).to eq(12.8)
    end

    it 'should properly calculate total meals expenses' do
        expect(calculate_meals(4)).to eq(36)
    end

    it 'should properly calculate total parking expenses' do
        expect(calculate_parking(35)).to eq(27.5)
    end
end