class CreateOndemandDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ondemand_details do |t|
      t.integer :cost
      t.text :item
      t.text :dress
      t.integer :member
      t.integer :age_group
      t.string :mood
      t.string :condition
      t.string :prohibition
      t.string :charm
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
