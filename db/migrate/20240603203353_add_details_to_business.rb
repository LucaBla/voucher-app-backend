class AddDetailsToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :phone_number, :string
    add_column :businesses, :street, :string
    add_column :businesses, :apt_suite_bldg, :string
    add_column :businesses, :city, :string
    add_column :businesses, :state, :string
    add_column :businesses, :zip_code, :string
    add_column :businesses, :country, :string
  end
end
