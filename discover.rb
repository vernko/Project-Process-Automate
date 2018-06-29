require 'selenium-webdriver'
require 'faker'
require_relative 'baseclass'

class DiscoverCard < BaseClass
  def initialize_discover
    @url = 'https://www.discovercard.com/application/apply?srcCde=GAYP'
    @driver.manage.window.maximize
    @driver.navigate.to @url
  end

  def input_intial_info
    first_name_field = @driver.find_element(:xpath => "//input[@name='firstName']")
    type_things(first_name_field, @first_name)
    sleep 1

    last_name_field = @driver.find_element(:xpath => "//input[@name='lastName']")
    type_things(last_name_field, @last_name)
    sleep 2

    middle_name_field = @driver.find_element(:xpath => "//input[@name='middleName']")
    middle_name_field.click
    sleep 1

    # pick_card_design = @driver.find_element(:xpath => "//ul[@class='cards']")
    # sleep 2
    # pick_card_design.click
    # sleep 2
    # throwing an error, page isn't available at this time, try again in 24 hrs.

    continue_button = @driver.find_element(:xpath => "//input[@title='Continue']")
    continue_button.click
    sleep 5
  end

  def input_general_info
    mailing_address_field = @driver.find_element(:xpath => "//input[@name='homeAddress1']")
    type_things(mailing_address_field, @mailing_address)
    sleep 1

    city_field = @driver.find_element(:xpath => "//input[@name='city']")
    type_things(city_field, @city)
    sleep 1

    state_selector_list = @driver.find_element(:xpath => "//select[@name='state']")
    options = state_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Utah"
      g.click
      break
      end
    end
    sleep 1

    zipcode_field = @driver.find_element(:xpath => "//input[@name='zipCode']")
    type_things(zipcode_field, @zipcode)
    sleep 1

    email_field = @driver.find_element(:xpath => "//input[@name='email']")
    type_things(email_field, @email)
    sleep 1

    primary_phone_field = @driver.find_element(:xpath => "//input[@name='homePhone']")
    type_things(primary_phone_field, @primary_phone)
    sleep 1
    
    dob_month_field = @driver.find_element(:xpath => "//input[@name='dobMonth']")
    type_things(dob_month_field, @dob)
    # may need additional for separate day & year fields
    # dob_day_field = @driver.find_element(:xpath => "//input[@name='dobDay']")
    # type_things(dob_day_field, @dob)
    # dob_year_field = @driver.find_element(:xpath => "//input[@name='dobYear']")
    # type_things(dob_year_field, @dob)
    sleep 1

    social_field = @driver.find_element(:xpath => "//input[@name='socialSecurity']")
    type_things(social_field, @social)
    sleep 1

    income_source_selector_list = @driver.find_element(:xpath => "//select[@name='employmentStatus']")
    options = income_source_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Employed Full-Time"
      g.click
      break
      end
    end
    sleep 1

    gross_income = @driver.find_element(:xpath => "//input[@name='income']")
    type_things(gross_income, @gross_income)
    sleep 1

    housing_payment = @driver.find_element(:xpath => "//input[@name='housingCost']")
    type_things(housing_payment, @housing_payment)

    total_assets = @driver.find_element(:xpath => "//input[@name='totalAssets']")
    type_things(total_assets, @total_assets)

    continue_button = @driver.find_element(:xpath => "//input[@title='Continue']")
    continue_button.click
    # asks to verify, click again that input email correctly if system not sure of domain
    sleep 2
  end

  def input_final_info
    sleep 1
    occupation_selector_list = @driver.find_element(:xpath => "//select[@class='occupation']")
    options = occupation_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "ADMINISTRATIVE/OFFICE SUPP"
      g.click
      break
      end
    end
    sleep 1
    
    employer = @driver.find_element(:xpath => "//input[@name='employer']")
    type_things(employer, @employer)
    sleep 1

    # length of employment is in number of years
    employment_time = @driver.find_element(:xpath => "//input[@name='employLength']")
    type_things(employment_length, @employment_length)
    sleep 1

    highest_education_level = @driver.find_element(:xpath => "//select[@name='education']")
    options = occupation_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Bachelor's Degree"
      g.click
      break
      end
    end
    sleep 1
    sleep 1

    # residence_selector
    # if select rent or other brings up Monthy Housing Payment field
    housing_type = @driver.find_element(:xpath => "//select[@name='value(housingStatus)']")
    options = housing_type.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Own Home"
      g.click
      break
      end
    end
    sleep 1

    current_residence_length = @driver.find_element(:xpath => "//input[@name='currentResidenceLength']")
    type_things(current_residence_length, @current_residence_length)
    sleep 1

    checking_debit_radio_button = @driver.find_element(:xpath => "//input[@name='checkingOrDebit']")
    checking_debit_radio_button.click

    savings_ira_radio_button = @driver.find_element(:xpath => "//input[@name='savingsIraMoneyMarket']")
    savings_ira_radio_button.click

    us_citizen_radio_button = @driver.find_element(:xpath => "//input[@name='citizen']")
    us_citizen_radio_button.click

    mothers_maiden_name_field = @driver.find_element(:xpath => "//input[@name='mothersMaidenName']")
    type_things(mothers_maiden_name_field, @mothers_maiden_name)
    sleep 1

    continue_button = @driver.find_element(:xpath => "//input[@title='Continue']")
    continue_button.click
    sleep 2
  end

  def review_submit
    consent_radio_button = @driver.find_element(:xpath => "//input[@name='eSignCheckbox']")
    consent_radio_button.click

    terms_agreement_box = @driver.find_element(:xpath => "//input[@name='termsCondsCheckbox']")
    terms_agreement_box.click

    submit_button = @driver.find_element(:xpath => "//button[@id='terms-conditions-submit']")
    submit_button.click
    sleep 10
    
    @driver.screenshot_as(:png)
    @driver.save_screenshot('discover_status.png')
  end
end