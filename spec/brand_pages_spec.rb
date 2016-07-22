require('spec_helper')

describe('brand functionality through the application', {:type => :feature}) do
  it('allows a user to add a new brand') do
    visit('/')
    click_link('Brand view')
    fill_in('brand_name', :with => 'Dansko')
    click_button('Save')
    expect(page).to have_content('Dansko')
  end
  it('allows a user to update a brand name') do
    visit('/')
    click_link('Brand view')
    fill_in('brand_name', :with => 'Reef')
    click_button('Save')
    click_link('Reef')
    click_button('Update')
    fill_in('new_brand_name', :with => "Keen")
    click_button('Update Brand')
    expect(page).to have_content('Keen')
  end
  it('allows a user to delete a brand name') do
    visit('/')
    click_link('Brand view')
    fill_in('brand_name', :with => 'Reef')
    click_button('Save')
    click_link('Reef')
    click_button('Update')
    click_button('Delete Brand')
    expect(page).to have_content("No Brands at this time.")
  end
end
