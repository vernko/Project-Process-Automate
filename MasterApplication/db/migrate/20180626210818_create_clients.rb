class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mailing_address
      t.string :city
      t.string :zipcode
      t.string :primary_phone
      t.string :email_address
      t.string :housing_type
      t.string :housing_payment
      t.string :gross_income
      t.string :employer
      t.string :marital_status
      t.string :social_security_number
      t.string :mothers_maiden_name

      t.timestamps
    end
  end
end
