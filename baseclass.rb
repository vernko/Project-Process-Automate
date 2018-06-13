class BaseClass
  def initialize
    @driver =  Selenium::WebDriver.for :chrome
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