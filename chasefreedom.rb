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

    zipcode_field = @driver.find_element(:xpath => "//input[@name='value(sZip)']")
    type_things(zipcode_field, @zipcode)
    sleep 4

    # next_button = @driver.find_element(:xpath => "//input[@id='next1']")
    # next_button.click
    # sleep 3
  end

  def financial_info
    checking = @driver.find_element(:xpath => "//input[@for='checking-checkbox']").click
    # not required
    saving = @driver.find_element(:xpath => "//input[@for='savings-checkbox']").click
    # not required

    # residence_selector
    # if select rent or other brings up Monthy Housing Payment field
    # housing_payment = @driver.find_element(:xpath => "//input[@name='value(sMonthlyMortgage)']")
    # type_things(housing_payment_field, @housing_payment)

    gross_income = @driver.find_element(:xpath => "//input[@name='value(sAnnualIncome)']")
    type_things(gross_income_field, @gross_income)

    # income_source_selector

    gross_income = @driver.find_element(:xpath => "//input[@name='value(sEmployerOpt)']")
    type_things(gross_income_field, @gross_income)
  end

  def security_info
    primary_phone = @driver.find_element(:xpath => "//input[@name='value(sHomePhone)']")
    type_things(primary_phone_field, @primary_phone)

    email = @driver.find_element(:xpath => "//input[@name='value(sEMailAddr2)']")
    type_things(email_field, @email)

    dob = @driver.find_element(:xpath => "//input[@name='value(sDOB)']")
    type_things(dob_field, @dob)

    social = @driver.find_element(:xpath => "//input[@name='value(sSSN)']")
    type_things(social_field, @social)

    mothers_maiden_name = @driver.find_element(:xpath => "//input[@name='value(sMaidenName)']")
    type_things(mothers_maiden_name_field, @mothers_maiden_name)
  end

  def review_submit
    authorized_user_first_name = @driver.find_element(:xpath => "//input[@name='value(sSecondaryFirstName1)']")
    type_things(authorized_user_first_name_field, @authorized_user_first_name)

    authorized_user_last_name = @driver.find_element(:xpath => "//input[@name='value(sSecondaryLastName1)']")
    type_things(authorized_user_last_name_field, @authorized_user_last_name)

    authorized_user_dob = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedDOB1)']")
    type_things(authorized_user_dob_field, @authorized_user_dob)

    authorized_user_mailing_address = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedStreetAddr11)']")
    type_things(authorized_user_mailing_address_field, @authorized_user_mailing_address)

    authorized_user_city = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedCity1)']")
    type_things(authorized_user_city_field, @authorized_user_city)

    authorized_user_zipcode = @driver.find_element(:xpath => "//input[@name='value(sAuthorizedZip1)']")
    type_things(authorized_user_zipcode_field, @authorized_user_zipcode)

    #OPTIONAL
    # Transfer Balances
    account_number = @driver.find_element(:xpath => "//input[@name='value(sRespFromAcctA1)']")
    type_things(account_number_field, @account_number)

    transfer_amount = @driver.find_element(:xpath => "//input[@name='value(sRespTransferAmtA1)']")
    type_things(transfer_amount_field, @transfer_amount)

    terms_agreement = @driver.find_element(:xpath => "//input[@name='sAcceptance']")
  end
end
