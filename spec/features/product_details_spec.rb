require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP create products and category before every run of test
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can navigate to product details from home page" do
    # ACT
    visit root_path
    first('h4').click

    # need delay for seeing the correct picture
    # sleep 3 
    # DEBUG check the image in tmp/capybara folder
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
