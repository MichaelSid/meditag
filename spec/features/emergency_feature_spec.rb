require 'spec_helper'

describe 'emergency page' do 

  context 'general info' do
    before do
      create(:user, uuid: 'hdd', profile: create(:profile), medications: [create(:medication)], conditions: [create(:asthma), create(:condition)])
    end

    it "shows firstname" do
      visit '/emergency/hdd'
      expect(page).to have_content 'John'
    end

    it 'shows lastname' do 
      visit '/emergency/hdd'
      expect(page).to have_content 'Smith'
    end

    context 'medications' do
      it 'shows all medications' do 
        visit '/emergency/hdd'

        expect(page).to have_content 'MyString'
        expect(page).to have_content 'MyText'
      end
    end

    context 'conditions' do

      it 'shows the first condition' do 
        visit '/emergency/hdd'

        expect(page).to have_content 'Cancer'
        expect(page).to have_content 'not so good'
      end

      it 'shows the second conditions' do 
        visit '/emergency/hdd'

        expect(page).to have_content 'Asthma'
        expect(page).to have_content "Can't breath"
      end
    end
  end
end