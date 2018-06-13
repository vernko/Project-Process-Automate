class BaseClass
  def initialize
    @driver =  Selenium::WebDriver.for :chrome
    @url = "https://applynow.chase.com/FlexAppWeb/renderApp.do?SPID=FQYC&CELL=6TKW&PROMO=DF01"
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @mailing_address = Faker::Address.street_address
    @city = Faker::Address.city
    @zipcode = Faker::Address.zip
    @marital_status =  Faker::Demographic.marital_status
  end

  def setup
    @driver.manage.window.maximize
    @driver.navigate.to @url
  end

  def find_element_with_wait(what, time = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: time) # seconds
    begin
    wait.until {
        element = @driver.find_element(what)
        element if element.displayed?
    }
    rescue Selenium::WebDriver::Error::TimeOutError
    puts "Couldn't find #{what}"
    return false
    end
  end

  def type_things (element, text)
    element.send_keys text
  end
  
  def close_browser
      @driver.quit
  end
end