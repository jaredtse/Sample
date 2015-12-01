require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'site_prism'  

 
World(Capybara)
      
browser = ENV['browser'] ||= 'chrome'
Capybara.default_driver = :selenium

AfterStep do
 sleep (ENV['PAUSE'] || 0).to_i
end
 
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
  :browser => browser.to_sym)
end
