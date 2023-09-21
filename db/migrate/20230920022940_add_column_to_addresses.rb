class AddColumnToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :post_code, :string
    add_column :addresses, :address, :string
    add_column :addresses, :name, :string
  end
end
