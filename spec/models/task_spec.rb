require 'rails_helper'

RSpec.describe Task, type: :model do

  context 'creating' do
    describe 'valid' do
      it 'with all required fields' do
        expect(build(:task)).to be_valid
      end
    end

    describe 'invalid' do
      it 'with all required fields empty' do
        expect(build(:task, :all_empty_fields)).to_not be_valid
      end
    end

  end
end
