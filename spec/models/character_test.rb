require 'rails_helper'

describe Character do

  describe '.new' do
    let(:name) { 'deaadpool'}
    let(:id) { '156' }
    let(:character) { Character.new(attributes) }
    
    context 'attributes' do
      it 'creates a character with a id and name' do
        expect(character.name).to eq('deaadpool')
        expect(character.id).to eq('156')
      end

      it 'raises an error' do
            expect do
              create(:character, name: nil)
            end.to raise_error(ActiveRecord::RecordInvalid)
          end
    end
  end
end