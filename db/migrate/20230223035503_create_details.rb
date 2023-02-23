class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :place
      t.integer :cost
      t.string :belonging
      t.string :dress
      t.boolean :status, default: false, null: false
      t.integer :member
      t.string :age_group

      t.timestamps
    end
  end
end
