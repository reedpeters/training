require 'rails_helper'

RSpec.describe 'Home Page Marketing Test', type: :system do
  it 'homepage has the title expected by marketing' do
    visit '/'
    expect(page).to have_text "Welcome to ACME® Barn Yard Veterinary Healthcare"
  end
  it 'has a link tp the products page that mentions a count of the products' do
    FactoryBot.create_list(:product, 5, published: true)
    FactoryBot.create_list(:product, 3, published: false)

    visit '/'
    expect(page).to have_link('Choose from 8 products', href: products_path)
  end
end