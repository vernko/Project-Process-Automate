class AddBirthDateToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :birth_date, :string
  end
end
