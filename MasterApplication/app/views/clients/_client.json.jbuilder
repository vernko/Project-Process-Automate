json.extract! client, :id, :first_name, :last_name, :mailing_address, :city, :zipcode, :primary_phone, :email_address, :housing_type, :housing_payment, :gross_income, :employer, :marital_status, :social_security_number, :mothers_maiden_name, :created_at, :updated_at
json.url client_url(client, format: :json)
