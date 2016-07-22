require('spec_helper')

describe('brand functionality through the application', {:type => :feature}) do
  it('allows a user to add a new brand') do
    visit('/')
    click_link('Brand view')
    fill_in('brand_name', :with => 'Dansko')
    click_button('Save')
    expect(page).to have_content('Dansko')
  end
end
