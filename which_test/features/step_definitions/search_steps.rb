When(/^I select the first TV from the search page$/) do
  @tv_page.first_tv.click
end

Then(/^I should be on TV specification page$/) do
  @tv_page.wait_until_hero_visible(30) 
end

When(/^I select to see only "([^"]*)" brand first$/) do |brand|
  @tv_page.find_text(@tv_page.categories, brand).click
end

Then(/^I should the product detail section$/) do
  wait_for_ajax	
  @tv_page.wait_until_products_visible(30)
end

Then(/^it should only contain "([^"]*)" model$/) do |brand|
   @tv_page.product_names.each do |product|
   	 product.text.should == brand
   end
end

When(/^I adjust the Screen Size to "([^"]*)"$/) do |size|
  @tv_page.find_text(@tv_page.categories, size).click
  @tv_page.wait_until_products_visible(30)
end

Then(/^I should see the tv displayed on the search result section$/) do
  expect(@tv_page).to be_displayed
  wait_for_ajax
end

Then(/^the result should be addjusted according to TV size$/) do
  @tv_page.sizes.each do |elm|
    elm.text.to_i.should < 26
  end
end

Given(/^I choose to create account with Which\?$/) do
  @tv_page.login.click
end

Then(/^I should be on the registration page$/) do
  @registration = Registration.new
  @registration.should be_displayed
  .to be_displayed
end

Given(/^I choose to login$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be on the login page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I selct a minimum TV price of "([^"]*)"$/) do |price|
  @tv_page.select(price, :from => "search_range_55_price_lower" )
  # @tv_page.check..set(true)
  wait_for_ajax	
end

Then(/^the list should not show price under "([^"]*)"$/) do |p|
  @tv_page.wait_until_products_visible(30)
  @tv_page.quotes.each do |price| 
  	price.text.match(/(\d+.\d+)/).captures.first.gsub(",","").to_f.should >= p.to_f
  end
end

Then(/^the list should not show price over "([^"]*)"$/) do |p|
  @tv_page.wait_until_products_visible(30)
  @tv_page.quotes.each do |price| 
  	price.text.match(/(\d+.\d+)/).captures.first.gsub(",","").to_f.should <= p.to_f
  end
end

