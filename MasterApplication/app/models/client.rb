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
                        :social_security_number,
                        :mothers_maiden_name
end
