require('spec_helper')

describe('store functionality through the application', {:type => :feature}) do
  it('allows a user to add a new store') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Sellwood Soles')
    click_button('Save')
    expect(page).to have_content('Sellwood Soles')
  end
end
