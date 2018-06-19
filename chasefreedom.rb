require 'selenium-webdriver'
require 'faker'
require_relative 'baseclass'

class ChaseFreedom < BaseClass
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

    # state_selector
    #### Interact with the drop down box
    state_selector_list = @driver.find_element(:xpath => "//select[@name='value(sState1)']")

    #### Extract all options from the select box
    options = state_selector_list.find_elements(:tag_name => "option")

    #### Select the option “UT”
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
    # checking_box = @driver.find_element(:xpath => "//div[@class='jpui-checkbox-radio']")
    # checking_box = @wait.until {
    #   element = @driver.find_element(:xpath => "//input[@value='checking']")
    #   element if element.displayed?
    # }
    # checking_box.click
    
    # saving_box = @driver.find_element(:xpath => "//input[@for='savings-checkbox']").click

    # residence_selector
    # if select rent or other brings up Monthy Housing Payment field
    housing_payment = @driver.find_element(:xpath => "//select[@name='value(sHousingType)']")
    options = housing_payment.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "Own"
      g.click
      break
      end
    end
    # type_things(housing_payment, @housing_payment)
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
    type_things(email_field, @email)
    sleep 1

    dob_field = @driver.find_element(:xpath => "//input[@name='value(sDOB)']")
    type_things(dob_field, @dob)
    sleep 1

    social_field = @driver.find_element(:xpath => "//input[@name='value(sSSN)']")
    type_things(social_field, @social)
    sleep 1

    mothers_maiden_name_field = @driver.find_element(:xpath => "//input[@name='value(sMaidenName)']")
    type_things(mothers_maiden_name_field, @mothers_maiden_name)
    sleep 1

    next_button = @driver.find_element(:xpath => "//button[@id='next3']")
    next_button.click
    sleep 1
  end

  def review_submit
    authorized_user_first_name_field = @driver.find_element(:xpath => "//input[@name='value(sSecondaryFirstName1)']")
    type_things(authorized_user_first_name_field, @authorized_user_first_name)
    sleep 1

    authorized_user_last_name_field = @driver.find_element(:xpath => "//input[@name='value(sSecondaryLastName1)']")
    type_things(authorized_user_last_name_field, @authorized_user_last_name)
    sleep 1

    authorized_user_dob_field = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedDOB1)']")
    type_things(authorized_user_dob_field, @authorized_user_dob)
    sleep 1

    authorized_user_mailing_address_field = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedStreetAddr11)']")
    type_things(authorized_user_mailing_address_field, @authorized_user_mailing_address)
    sleep 1

    authorized_user_city_field = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedCity1)']")
    type_things(authorized_user_city_field, @authorized_user_city)
    sleep 1

    authorized_state_selector_list = @driver.find_element(:xpath => "//select[@name='value(sAuthorizedState11)']")
    options = authorized_state_selector_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == "UT"
      g.click
      break
      end
    end
    sleep 1

    authorized_user_zipcode_field = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedZip1)']")
    type_things(authorized_user_zipcode_field, @authorized_user_zipcode)
    sleep 1

    #OPTIONAL
    # Transfer Balances
    # account_number = @driver.find_element(:xpath => "//input[@name='value(sRespFromAcctA1)']")
    # type_things(account_number_field, @account_number)

    # transfer_amount = @driver.find_element(:xpath => "//input[@name='value(sRespTransferAmtA1)']")
    # type_things(transfer_amount_field, @transfer_amount)

    terms_agreement_box = @driver.find_element(:xpath => "//label[@for='sAcceptance']")
    terms_agreement_box.click

    submit_button = @driver.find_element(:xpath => "//button[@id='flexappsubmit']")
    sleep 4
  end
end
