class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :street_line, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :zipcode, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
