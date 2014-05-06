require 'spec_helper'

describe 'User conditions' do

before do
	 @alex = create(:user)
	 login_as @alex
	 create(:profile, user: @alex)

	 visit '/conditions/new'
	end

	it 'should display a button for adding conditions' do
		expect(page).to have_selector(:link_or_button, 'Add')
	end

	context 'Empty by default, no conditions have been added' do
		it 'should have two empty fields' do
			expect(find_field('Condition').value).to be_blank
			expect(find_field('Notes').value).to be_blank
		end
	end

	describe 'Adding a condition' do
		it 'should be listed in the form', js: true do
			fill_in 'Condition', with: 'Diabetes'
			fill_in 'Notes', with: 'Diabetes sucks!'
			click_button 'Save Conditions'
			expect(current_path).to eq '/conditions/new'
			expect(find_field('Condition').value).to eq "Diabetes"
		end
	end


	describe 'User can delete a condition', js: true do 
		it 'should permanently destroy the condition record' do
			create(:condition, user: @alex)
			visit current_path
			expect(find_field('Condition').value).to eq 'Cancer'
			page.find('.remove_fields').click
			click_button 'Save Conditions'
			expect(page).not_to have_content 'Cancer'
			expect(find_field('Condition').value).to be_blank
		end
	end

	describe 'User can tick the Emergency checkbox', js: true do
		it 'should set the emergency field to true' do
			create(:condition, user: @alex)
			find('.emergency-field').click
			expect(find('.emergency-field')).to be_checked
			click_button 'Save Conditions'
			expect(find('.emergency-field')).to be_true
		end
	end

end





