require('capybara/rspec')
require('./app')

DB = PG.connect({:dbname => 'hair_salon_test'})

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Add a new stylist and see the stylists information', {:type => :feature}) do
  it('allows a user to click a stylist to see their details') do
    visit('/')
    click_link('See list of stylists')
    click_link('Add a new stylist to the system')
    fill_in('stylist_name', :with => 'Joan of Arc')
    click_button('Add stylist')
    click_link('Joan of Arc')
    expect(page).to have_content('Manage Joan of Arc')
  end
end
