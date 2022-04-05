class CreateLikelyBirds < ActiveRecord::Migration[7.0]
  def change
    create_table :likely_birds do |t|
      t.integer :checklist_id
      t.integer :bird_id
      t.boolean :has_seen

      t.timestamps
    end
  end
end
