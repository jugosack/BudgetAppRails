require 'rails_helper'

RSpec.describe 'Expenditure', type: :feature do
  describe 'Expenditure' do
    before(:each) do
      @user = User.create! password: '123456', email: 'jugoslav@email.com', name: 'Jugoslav'
      @group = Group.create! name: 'group', author_id: @user.id, icon: 'Education'
      Entity.create! name: 'Entity', author_id: @user.id, amount: 55, group_id: @group.id
      Entity.create! name: 'new Entity', author_id: @user.id, amount: 55, group_id: @group.id

      visit '/users/sign_in'
      fill_in 'Email', with: 'jugoslav@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    scenario 'I can see an expenditure I added' do
      click_link 'group'
      expect(page).to have_content('Entity')
      expect(page).to have_content('55')
    end

    scenario 'I can see a total expenditure amount' do
      click_link 'group'
      expect(page).to have_content('new Entity')
      expect(page).to have_content('total spent: $110')
    end

    scenario 'I can open a a page to add a new expenditure' do
      click_link 'group'
      click_link 'Add a new entity'
      expect(page).to have_content('NEW ENTITY')
    end
  end
end
