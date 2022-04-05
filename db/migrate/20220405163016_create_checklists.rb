class CreateChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :checklists do |t|
      t.integer :user_id
      t.string :name
      t.string :locId
      t.datetime :time

      t.timestamps
    end
  end
end
