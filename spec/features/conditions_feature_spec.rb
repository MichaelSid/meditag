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
		xit 'should have two empty fields' do
			find_field('user_conditions_attributes_0_condition').should eq nil
			expect(condition.notes).to be_empty
		end
	end

	describe 'Adding a condition' do
		it 'should be listed in the form', js: true do
			page.find('.add_fields').click
			fill_in 'user_conditions_attributes_0_condition', with: 'Diabetes'
			fill_in 'user_conditions_attributes_0_notes', with: 'Diabetes sucks!'
			click_button 'Save Conditions'
			expect(current_path).to eq '/conditions/new'
			expect(page).to have_content "Diabetes"
		end
	end

	describe 'Clicking on a condition' do

		it 'should take us to the condition page and display details' do
			create(:condition, user: @alex)
			visit current_path
			click_link 'Cancer'
			expect(page).to have_content 'not so good'
			expect(current_path).to eq '/conditions/' + @alex.conditions.first.id.to_s
		end
	end

	describe 'User can delete a condition' do 
		it 'should permanently destroy the condition record' do
			create(:condition, user: @alex)
			visit current_path
			click_link 'Delete Cancer' 
			expect(page).not_to have_content 'Cancer'
			expect(page).to have_content 'Condition deleted successfully!'
		end
	end

	describe 'User can edit a condition' do
		it 'should update the restaurant details' do
			create(:condition, user: @alex)
			visit current_path
			click_link 'Edit'
			fill_in 'Condition', with: 'Terrible cancer'
			click_button 'Update Condition'
			expect(page).to have_content 'Terrible cancer'
		end
	end

end





