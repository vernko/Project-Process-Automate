require 'selenium-webdriver'

class Client < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name, :mailing_address,
                        :city,
                        :zipcode,
                        :state,
                        :primary_phone, :email_address,
                        :housing_type,
                        :housing_payment,
                        :gross_income,
                        :employer,
                        :employment_status,
                        :social_security_number,
                        :birth_date,
                        :mothers_maiden_name
  
  def populate
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    @driver.get("http://google.com")
    @url = 'https://applynow.chase.com/FlexAppWeb/renderApp.do?SPID=FQYC&CELL=6TKW&PROMO=DF01'
    @driver.manage.window.maximize
    @driver.navigate.to @url
    @first_name = first_name
    @last_name = last_name
    @mailing_address = mailing_address
    @city = city
    @zipcode = zipcode
    @state = state
    @primary_phone = primary_phone
    @email_address = email_address
    @housing_type = housing_type
    @housing_payment = housing_payment
    @gross_income = gross_income
    @employment_status = employment_status
    @employer = employer
    @birth_date = birth_date
    @social_security_number = social_security_number
    @mothers_maiden_name = mothers_maiden_name
  end

  def type_things (element, text)
    element.send_keys text
  end

  def personal_info
    first_name_field = @driver.find_element(:xpath => "//input[@name='value(sFirstName)']")
    type_things(first_name_field, @first_name)
    sleep 1
 
    last_name_field = @driver.find_element(:xpath => "//input[@name='value(sLastName)']")
    type_things(last_name_field, @last_name)
    sleep 1
 
    mailing_address_field = @driver.find_element(:xpath => "//input[@name='value(sStreetAddr1)']")
    type_things(mailing_address_field, @mailing_address)
    sleep 1

    city_field = @driver.find_element(:xpath => "//input[@name='value(sCity)']")
    type_things(city_field, @city)
    sleep 1
 
    state_selector_list = @driver.find_element(:xpath => "//select[@name='value(sState1)']")
    options = state_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "UT"
      g.click
      break
      end
    end
    sleep 1
 
    zipcode_field = @driver.find_element(:xpath => "//input[@name='value(sZip)']")
    type_things(zipcode_field, @zipcode)
    sleep 1
 
    next_button = @driver.find_element(:xpath => "//button[@id='next1']")
    next_button.click
    sleep 2
  end

  def financial_info
    sleep 1
    housing_type = @driver.find_element(:xpath => "//select[@name='value(sHousingType)']")
        options = housing_type.find_elements(:tag_name => "option")
        options.each do |g|
          if g.text == "Own"
          g.click
          break
          end
        end
    sleep 1
 
    gross_income = @driver.find_element(:xpath => "//input[@name='value(sAnnualIncome)']")
    type_things(gross_income, @gross_income)
    sleep 1
 
    income_source_selector_list = @driver.find_element(:xpath => "//select[@name='value(sPosition)']")
    options = income_source_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Employed"
      g.click
      break
      end
    end
    sleep 1
 
    employer = @driver.find_element(:xpath => "//input[@name='value(sEmployerOpt)']")
    type_things(employer, @employer)
    sleep 1
 
    next_button = @driver.find_element(:xpath => "//button[@id='next2']")
    next_button.click
    sleep 2
  end

  def security_info
    sleep 1
    primary_phone_field = @driver.find_element(:xpath => "//input[@name='value(sHomePhone)']")
    type_things(primary_phone_field, @primary_phone)
    sleep 1
 
    email_field = @driver.find_element(:xpath => "//input[@name='value(sEMailAddr2)']")
    type_things(email_field, @email_address)
    sleep 1
 
    dob_field = @driver.find_element(:xpath => "//input[@name='value(sDOB)']")
    type_things(dob_field, @birth_date)
    sleep 1
 
    social_field = @driver.find_element(:xpath => "//input[@name='value(sSSN)']")
    type_things(social_field, @social_security_number)
    sleep 1
 
    mothers_maiden_name_field = @driver.find_element(:xpath => "//input[@name='value(sMaidenName)']")
    type_things(mothers_maiden_name_field, @mothers_maiden_name)
    sleep 1
 
    next_button = @driver.find_element(:xpath => "//button[@id='next3']")
    next_button.click
    sleep 1
  end

  def review_submit
    terms_agreement_box = @driver.find_element(:xpath => "//label[@for='sAcceptance']")
    terms_agreement_box.click

    submit_button = @driver.find_element(:xpath => "//button[@id='flexappsubmit']")
    submit_button.click
    sleep 10
    
    @driver.screenshot_as(:png)
    @driver.save_screenshot('chase_status.png')
  end

  def close_browser
    @driver.quit
  end

end