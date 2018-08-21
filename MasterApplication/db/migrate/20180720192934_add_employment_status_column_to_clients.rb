class AddEmploymentStatusColumnToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :employment_status, :string
  end
end
