require 'rails_helper'

RSpec.describe Helpers, type: :helper do
	describe '#showMessage' do
		it 'return Trying to save a lead' do 
			expect(helper.showMessage).to eq('Trying to save a lead')
		end
	end
end