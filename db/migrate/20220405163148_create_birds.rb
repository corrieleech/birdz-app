class CreateBirds < ActiveRecord::Migration[7.0]
  def change
    create_table :birds do |t|
      t.string :speciesCode

      t.timestamps
    end
  end
end
