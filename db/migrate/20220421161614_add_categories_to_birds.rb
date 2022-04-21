class AddCategoriesToBirds < ActiveRecord::Migration[7.0]
  def change
    add_column :birds, :comName, :string
    add_column :birds, :sciName, :string
  end
end
