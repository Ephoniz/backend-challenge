require 'file_utils'
require 'spec_helper'
include FileUtils

RSpec.describe FileUtils do
    let(:data) { get_csv_data('lib/first_month.csv') }

    describe '#open_file' do
        it 'should handle not existing file error' do
            expect{ open_file("") }.to raise_error(IOError)
        end
    end

    describe '#get_csv_data' do
        it 'should get the data from a csv file' do
            expect(get_csv_data('lib/first_month.csv')).not_to be_empty
        end
    end
end