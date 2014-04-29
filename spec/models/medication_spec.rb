require 'spec_helper'

describe "medication" do
  context 'adding medication' do 
    before { @user = create(:user) }
    it 'should add it to the database' do 
      create(:medication, user: @user)

      expect(Medication.count).to eq 1
    end
  end
end