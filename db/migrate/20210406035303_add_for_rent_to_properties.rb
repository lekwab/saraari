class AddForRentToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :for_rent, :boolean, default: true
  end
end
