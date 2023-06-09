require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    before(:each) do
      @user = User.create! password: '123456', email: 'jugoslav@email.com', name: 'Jugoslav'
      Group.create! name: 'group', author_id: @user.id, icon: 'Education'

      visit '/users/sign_in'
      fill_in 'Email', with: 'jugoslav@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    scenario 'Category button' do
      expect(page).to have_content('ADD A NEW CATEGORY')
    end

    scenario 'I can see a category I added' do
      expect(page).to have_content('group')
    end

    scenario 'A NEW CATEGORY page' do
      click_link 'ADD A NEW CATEGORY'
      expect(page).to have_content('Select a category :')
    end

    scenario 'A NEW CATEGORY page' do
        click_link 'ADD A NEW CATEGORY'
        expect(page).to have_content('Name')
      end
  end
end