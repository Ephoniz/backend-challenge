require 'monthly_expenses_calculator'
require 'spec_helper'

describe 'monthly_expenses_calculator' do
    it 'should get the data from a csv file' do
        expect(get_expenses_data('lib/data.csv')).not_to be_empty
    end
end