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
    fill_in('new_store_name', :with => "House")
    click_button('Update Store')
    expect(page).to have_content('House')
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
  it('allows the user to remove a brand from a store') do
    Brand.create({:name => 'Puma'})
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Sellwood Soles')
    check('store_brand[]')
    click_button('Save')
    click_link('Sellwood Soles')
    click_button('Update')
    select('Puma', :from => 'brand_remove')
    click_button('Remove Brand')
    expect(page).to have_no_content('Puma')
  end
  it('allows the user to add a brand to a store') do
    Brand.create({:name => "Altra"})
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Moreland Marathon')
    check('store_brand[]', :exact => "Altra")
    click_button('Save')
    click_link('Moreland Marathon')
    expect(page).to have_content('Altra')

  end
end
