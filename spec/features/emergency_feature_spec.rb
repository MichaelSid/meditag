require 'spec_helper'

describe 'emergency page' do 

  context 'general info' do
    before do
      @rick = create(:user, profile: create(:profile), medications: [create(:medication), create(:pulmecort)], conditions: [create(:asthma), create(:condition)])
    end

    it "shows firstname" do
      login_as @rick
      visit "/emergency/#{@rick.id}"
      expect(page).to have_content 'John'
    end

    context 'medications' do
      it 'do not shows medication' do 
        visit emergency_path(@rick)

        expect(page).not_to have_content 'MyString'
        expect(page).not_to have_content 'MyText'
      end

      it 'shows the second medication' do 
        visit emergency_path(@rick)

        expect(page).to have_content 'Pulmecort'
        expect(page).to have_content '2mg'
      end
    end

    context 'conditions' do

      it 'do not show the first condition' do 
       visit emergency_path(@rick)

        expect(page).not_to have_content 'Cancer'
        expect(page).not_to have_content 'not so good'
      end

      it 'shows the second conditions' do 
        visit emergency_path(@rick)

        expect(page).to have_content 'Asthma'
        expect(page).to have_content "Can't breath"
      end
    end
  end
end