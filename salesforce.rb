require 'selenium-webdriver'
require_relative 'baseclass'

class Salesforce < BaseClass
  first_name_field = @driver.find_element(:xpath => "//input[@name='value(sFirstName)']")
  sleep 1

  last_name_field = @driver.find_element(:xpath => "//input[@name='value(sLastName)']")
  sleep 1

  mailing_address_field = @driver.find_element(:xpath => "//input[@name='value(sStreetAddr1)']")
  sleep 1

  city_field = @driver.find_element(:xpath => "//input[@name='value(sCity)']")
  sleep 1

  state_selector_list = @driver.find_element(:xpath => "//select[@name='value(sState1)']")
  sleep 1

  zipcode_field = @driver.find_element(:xpath => "//input[@name='value(sZip)']")
  sleep 1

  gross_income = @driver.find_element(:xpath => "//input[@name='value(sAnnualIncome)']")
  sleep 1

  employer = @driver.find_element(:xpath => "//input[@name='value(sEmployerOpt)']")
  sleep 1

  primary_phone_field = @driver.find_element(:xpath => "//input[@name='value(sHomePhone)']")
  sleep 1

  email_field = @driver.find_element(:xpath => "//input[@name='value(sEMailAddr2)']")
  sleep 1

  dob_field = @driver.find_element(:xpath => "//input[@name='value(sDOB)']")
  sleep 1

  social_field = @driver.find_element(:xpath => "//input[@name='value(sSSN)']")
  sleep 1

  mothers_maiden_name_field = @driver.find_element(:xpath => "//input[@name='value(sMaidenName)']")
  sleep 1
end