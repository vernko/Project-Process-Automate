require 'selenium-webdriver'
require 'rspec'
require_relative 'chasefreedom'

describe "Input initial information in Chase application" do
  before(:each) do
    @browser = ChaseFreedom.new
    @browser.setup
  end

  # after(:each) do
  #   @browser.close_browser
  # end

  it 'inputs information' do
    @browser.personal_info
    @browser.financial_info
    @browser.security_info
    @browser.review_submit
  end
end