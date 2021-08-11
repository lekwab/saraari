class AddComapanyToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :company, :text
  end
end
