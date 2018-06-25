require 'selenium-webdriver'
require 'rspec'
require_relative 'discover'

describe "Fill out Discover's card application" do
  before(:each) do
    @browser = DiscoverCard.new
    @browser.initialize_discover
  end

  after(:each) do
    @browser.close_browser
  end

  it 'inputs information' do
    @browser.input_intial_info
    @browser.input_general_info
    @browser.input_final_info
    @browser.review_submit
  end
end