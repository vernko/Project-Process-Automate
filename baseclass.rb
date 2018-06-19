class BaseClass
  def initialize
    @driver =  Selenium::WebDriver.for :chrome
    @url = "https://applynow.chase.com/FlexAppWeb/renderApp.do?SPID=FQYC&CELL=6TKW&PROMO=DF01"
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @mailing_address = Faker::Address.street_address
    @city = "Springville"
    @zipcode = "84663"
    @gross_income = Faker::Number.number(5)
    @employer = Faker::Company.name
    @marital_status =  Faker::Demographic.marital_status
    @primary_phone = Faker::PhoneNumber.cell_phone
    @email =Faker::Internet.free_email
    @dob = "05061980"
    @social = "643130001"
    @mothers_maiden_name = Faker::Name.last_name
    @authorized_user_first_name = Faker::Name.first_name
    @authorized_user_last_name = Faker::Name.last_name
    @authorized_user_dob = "04061970"
    @authorized_user_mailing_address = Faker::Address.street_address
    @authorized_user_city = "Springville"
    @authorized_user_zipcode = "84663"
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