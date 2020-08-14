class AddCustomernameToUser < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :customer_name, :string
  end
end
