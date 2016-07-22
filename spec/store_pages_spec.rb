require('spec_helper')

describe('store functionality through the application', {:type => :feature}) do
  it('allows a user to add a new store') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Sellwood Soles')
    click_button('Save')
    expect(page).to have_content('Sellwood Soles')
  end
  it('allows a user to update a store name') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Sellwood Soles')
    click_button('Save')
    click_link('Sellwood Soles')
    click_button('Update')
    fill_in('new_store_name', :with => "House of Soles")
    click_button('Update Store')
    expect(page).to have_content('House of Soles')
  end
  it('allows a user to delete a store name') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Sellwood Soles')
    click_button('Save')
    click_link('Sellwood Soles')
    click_button('Update')
    click_button('Delete')
    expect(page).to have_content("No Stores at this time.")
  end
end
